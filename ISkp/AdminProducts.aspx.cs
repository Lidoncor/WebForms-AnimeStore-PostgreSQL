using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace ISkp
{
    public partial class AdminProducts : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Command;
        NpgsqlDataAdapter DataAdapter;
        DataTable DataTable;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var aa = Application["UserRole"];
            if ((string)aa != "admin")
            {
                Response.Redirect("Default.aspx");
            }
            if (!Page.IsPostBack)
            {
                Show();
            }
        }

        private void Show()
        {
            Connect.Open();

            Command = new NpgsqlCommand(@"select product.id, product.name, product.info, product.price, type.name as type_name, product.picture, product.instock
                                          from product, type
                                          where product.type = type.id order by product.id", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);
            
            GridView1.DataSource = DataTable;
            GridView1.DataBind();

            Command = new NpgsqlCommand("select * from type order by id", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataSet ds = new DataSet();
            DataAdapter.Fill(ds);

            ProductType.DataTextField = ds.Tables[0].Columns["name"].ToString();
            ProductType.DataValueField = ds.Tables[0].Columns["id"].ToString();

            ProductType.DataSource = ds.Tables[0];
            ProductType.DataBind();

            Connect.Close();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Show();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Show();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GridView1.Rows[e.RowIndex].FindControl("idlbl") as Label;
            TextBox name = GridView1.Rows[e.RowIndex].FindControl("nametext") as TextBox;
            TextBox price = GridView1.Rows[e.RowIndex].FindControl("pricetext") as TextBox;
            TextBox info = GridView1.Rows[e.RowIndex].FindControl("infotext") as TextBox;
            string ProductTypeList = (GridView1.Rows[e.RowIndex].FindControl("ProductTypeList") as DropDownList).SelectedItem.Value;
            string instock = (GridView1.Rows[e.RowIndex].FindControl("InstockListEdit") as DropDownList).SelectedItem.Value;
            FileUpload FileUpload1 = (GridView1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload);

            Connect.Open();

            if (FileUpload1.HasFile)
            {
                try
                {
                    FileUpload1.SaveAs("C:\\Users\\Danil\\source\\repos\\ISkp anime\\ISkp\\assets\\img\\" + FileUpload1.FileName);

                    Command = new NpgsqlCommand("update product set picture=@pic where id=@idparam", Connect);
                    Command.Parameters.AddWithValue("@idparam", Int32.Parse(id.Text));
                    Command.Parameters.AddWithValue("@pic", FileUpload1.FileName.Remove(FileUpload1.FileName.LastIndexOf(".")));
                    Command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                }
            }

            try
            {
                Command = new NpgsqlCommand("update product set name=@name, info=@info, price=@price, type=@type, instock=@instock where id=@idparam", Connect);
                Command.Parameters.AddWithValue("@idparam", Int32.Parse(id.Text));
                Command.Parameters.AddWithValue("@name", name.Text);
                Command.Parameters.AddWithValue("@info", info.Text);
                Command.Parameters.AddWithValue("@price", Int32.Parse(price.Text));
                Command.Parameters.AddWithValue("@type", Int32.Parse(ProductTypeList));
                Command.Parameters.AddWithValue("@instock", Convert.ToBoolean(instock));
                Command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }


            Connect.Close();

            GridView1.EditIndex = -1;

            Show();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label idlbl = GridView1.Rows[e.RowIndex].FindControl("idlbl") as Label;

            Connect.Open();

            Command = new NpgsqlCommand("update product set instock=false where id=@id1", Connect);
            Command.Parameters.AddWithValue("@id1", Int32.Parse(idlbl.Text));
            Command.ExecuteNonQuery();

            Connect.Close();

            Show();
        }

        protected void FindButton_Click(object sender, EventArgs e)
        {
            Connect.Open();

            try
            {
                Command = new NpgsqlCommand(@"select product.id, product.name, product.info, product.price, type.name as type_name, product.picture, product.instock
                                              from product, type
                                              where product.type = type.id and product." + valueList.SelectedValue + " = '" + valueText.Text + "'", Connect);
                DataAdapter = new NpgsqlDataAdapter(Command);
                DataTable = new DataTable();
                DataAdapter.Fill(DataTable);
                GridView1.DataSource = DataTable;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
               //
            }

            Connect.Close();

        }

        protected void ShowAllButton_Click(object sender, EventArgs e)
        {
            Show();
        }

        protected void NewRecordButton_Click(object sender, EventArgs e)
        {
            NewRecordButton.Visible = false;

            namelbl.Visible = true;
            pricelbl.Visible = true;
            infolbl.Visible = true;
            typelbl.Visible = true;

            NewName.Visible = true;
            Newprice.Visible = true;
            NewInfo.Visible = true;
            ProductType.Visible = true;

            InsertButton.Visible = true;
            CancelButton.Visible = true;
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            NewRecordButton.Visible = true;

            NewName.Visible = false;
            Newprice.Visible = false;
            NewInfo.Visible = false;
            ProductType.Visible = false;

            namelbl.Visible = false;
            pricelbl.Visible = false;
            infolbl.Visible = false;
            typelbl.Visible = false;

            InsertButton.Visible = false;
            CancelButton.Visible = false;
            NewName.Text = "";
            Newprice.Text = "";
            NewInfo.Text = "";
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            Connect.Open();

            try
            {
                Command = new NpgsqlCommand("insert into product (name, info, price, type) values (@name, @info, @price, @type)", Connect);
                Command.Parameters.AddWithValue("@name", NewName.Text);
                Command.Parameters.AddWithValue("@info", NewInfo.Text);
                Command.Parameters.AddWithValue("@price", Int32.Parse(Newprice.Text));
                Command.Parameters.AddWithValue("@type", Int32.Parse(ProductType.SelectedValue));
                Command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }

            Connect.Close();

            NewRecordButton.Visible = true;

            namelbl.Visible = false;
            pricelbl.Visible = false;
            infolbl.Visible = false;
            typelbl.Visible = false;

            NewName.Visible = false;
            Newprice.Visible = false;
            NewInfo.Visible = false;
            ProductType.Visible = false;

            InsertButton.Visible = false;
            CancelButton.Visible = false;
            NewName.Text = "";
            Newprice.Text = "";
            NewInfo.Text = "";

            Show();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                Command = new NpgsqlCommand("select * from type order by id", Connect);
                DataAdapter = new NpgsqlDataAdapter(Command);
                DataSet ds = new DataSet();
                DataAdapter.Fill(ds);

                DropDownList ProductTypeList = (e.Row.FindControl("ProductTypeList") as DropDownList);

                ProductTypeList.DataTextField = ds.Tables[0].Columns["name"].ToString();
                ProductTypeList.DataValueField = ds.Tables[0].Columns["id"].ToString();

                ProductTypeList.DataSource = ds.Tables[0];
                ProductTypeList.DataBind();

                string selected = DataBinder.Eval(e.Row.DataItem, "type_name").ToString();
                ProductTypeList.Items.FindByText(selected).Selected = true;

                DropDownList instocklistedit = (e.Row.FindControl("InstockListEdit") as DropDownList);
                instocklistedit.Items.Add(new ListItem("true", "true"));
                instocklistedit.Items.Add(new ListItem("false", "false"));

                string selectedStock = DataBinder.Eval(e.Row.DataItem, "instock").ToString().ToLower();
                instocklistedit.Items.FindByText(selectedStock).Selected = true;
            }
        }
    }
}
