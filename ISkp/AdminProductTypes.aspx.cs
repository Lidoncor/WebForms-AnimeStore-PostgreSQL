using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using System.Data;
using System.Configuration;

namespace ISkp
{
    public partial class AdminProductTypes : System.Web.UI.Page
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

            Command = new NpgsqlCommand("select * from type order by id", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);

            Connect.Close();

            ProductTypesGridView.DataSource = DataTable;
            ProductTypesGridView.DataBind();
        }

        protected void ProductTypesGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ProductTypesGridView.EditIndex = e.NewEditIndex;
            Show();
        }

        protected void ProductTypesGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ProductTypesGridView.EditIndex = -1;
            Show();
        }

        protected void ProductTypesGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = ProductTypesGridView.Rows[e.RowIndex].FindControl("ProductTypeId") as Label;
            TextBox ProductTypeNameInput = ProductTypesGridView.Rows[e.RowIndex].FindControl("ProductTypeNameInput") as TextBox;
            string instock = (ProductTypesGridView.Rows[e.RowIndex].FindControl("InstockListEdit") as DropDownList).SelectedItem.Value;

            Connect.Open();

            Command = new NpgsqlCommand("update type set name=@ProductType, instock=@Instock where id=@TypeId", Connect);
            Command.Parameters.AddWithValue("@TypeId", Int32.Parse(Id.Text));
            Command.Parameters.AddWithValue("@ProductType", ProductTypeNameInput.Text);
            Command.Parameters.AddWithValue("@instock", Convert.ToBoolean(instock));
            Command.ExecuteNonQuery();

            Command = new NpgsqlCommand("update product set instock=@Instock where type=@TypeId", Connect);
            Command.Parameters.AddWithValue("@TypeId", Int32.Parse(Id.Text));
            Command.Parameters.AddWithValue("@instock", Convert.ToBoolean(instock));
            Command.ExecuteNonQuery();

            Connect.Close();

            ProductTypesGridView.EditIndex = -1;

            Show();
        }

        protected void ProductTypesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label Id = ProductTypesGridView.Rows[e.RowIndex].FindControl("ProductTypeId") as Label;
            
            Connect.Open();

            Command = new NpgsqlCommand("update product set instock=false where type=@TypeId", Connect);
            Command.Parameters.AddWithValue("@TypeId", Int32.Parse(Id.Text));
            Command.ExecuteNonQuery();

            Command = new NpgsqlCommand("update type set instock=false where id=@TypeId", Connect);
            Command.Parameters.AddWithValue("@TypeId", Int32.Parse(Id.Text));
            Command.ExecuteNonQuery();

            Connect.Close();

            Show();
        }

        protected void ShowButton_Click(object sender, EventArgs e)
        {
            Show();
        }

        protected void FindButton_Click(object sender, EventArgs e)
        {
            try
            {
                Connect.Open();

                Command = new NpgsqlCommand("select * from type where " + valueList.SelectedValue + " = '" + valueText.Text + "'", Connect);
                DataAdapter = new NpgsqlDataAdapter(Command);
                DataTable = new DataTable();
                DataAdapter.Fill(DataTable);

                Connect.Close();

                ProductTypesGridView.DataSource = DataTable;
                ProductTypesGridView.DataBind();
            }
            catch (Exception ex)
            {
                //
            }

        }

        protected void NewRecordButton_Click(object sender, EventArgs e)
        {
            NewRecordButton.Visible = false;

            NewTypeLabel.Visible = true;
            NewType.Visible = true;
            
            InsertButton.Visible = true;
            CancelButton.Visible = true;
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            NewRecordButton.Visible = true;
            NewTypeLabel.Visible = false;
            NewType.Visible = false;
            
            InsertButton.Visible = false;
            CancelButton.Visible = false;
            NewType.Text = "";
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            Connect.Open();

            Command = new NpgsqlCommand("insert into type (name) values (@name)", Connect);
            Command.Parameters.AddWithValue("@name", NewType.Text);
            Command.ExecuteNonQuery();

            Connect.Close();

            NewRecordButton.Visible = true;

            NewTypeLabel.Visible = false;
            NewType.Visible = false;
            
            InsertButton.Visible = false;
            CancelButton.Visible = false;
            NewType.Text = "";
            
            Show();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && ProductTypesGridView.EditIndex == e.Row.RowIndex)
            {
                DropDownList instocklistedit = (e.Row.FindControl("InstockListEdit") as DropDownList);
                instocklistedit.Items.Add(new ListItem("true", "true"));
                instocklistedit.Items.Add(new ListItem("false", "false"));

                string selectedStock = DataBinder.Eval(e.Row.DataItem, "instock").ToString().ToLower();
                instocklistedit.Items.FindByText(selectedStock).Selected = true;
            }
        }
    }
}