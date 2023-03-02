using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Npgsql;
using System.Configuration;

namespace ISkp
{
    public partial class Cart : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Command;
        NpgsqlDataAdapter DataAdapter;
        DataTable DataTable;
        ArrayList CartList;

        protected void Page_Load(object sender, EventArgs e)
        {
            var UserRole = Application["UserRole"];
            if ((string)UserRole == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                show();
            }
        }

        private void show()
        {
            Connect.Open();

            CartList = (ArrayList)Application["CartList"];

            Command = new NpgsqlCommand("select * from product where id = ANY(@CartList)", Connect);
            Command.Parameters.AddWithValue("@CartList", NpgsqlTypes.NpgsqlDbType.Array | NpgsqlTypes.NpgsqlDbType.Integer, CartList);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);
            Connect.Close();

            CartGridView.DataSource = DataTable;
            CartGridView.DataBind();

            if (DataTable.Rows.Count == 0)
            {
                if (Request.QueryString["success"] != null)
                {
                    CheckoutButton.Visible = false;
                    CartState.Text = "Заказ №" + Request.QueryString["success"] + " успешно оформлен";
                    CartState.Visible = true;
                }
                else
                {
                    CheckoutButton.Visible = false;
                    CartState.Text = "Корзина пустая";
                    CartState.Visible = true;
                }
            }
            else
            {
                CheckoutButton.Visible = true;
            }
        }

        protected void CartGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CartList = (ArrayList)Application["CartList"];

            Label ProductId = CartGridView.Rows[e.RowIndex].FindControl("ProductId") as Label;
            int CartItem = CartList.IndexOf(Int32.Parse(ProductId.Text));
            CartList.Remove(CartList[CartItem]);

            show();
        }

        protected void CheckoutButton_Click(object sender, CommandEventArgs e)
        {
            Connect.Open();

            CartList = (ArrayList)Application["CartList"];

            Command = new NpgsqlCommand("select * from product where id = ANY(@CartList)", Connect);
            Command.Parameters.AddWithValue("@CartList", NpgsqlTypes.NpgsqlDbType.Array | NpgsqlTypes.NpgsqlDbType.Integer, CartList);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);

            Command = new NpgsqlCommand(@"insert into orders(price, date, user_id)
                                         values((select sum(product.price) from product where id = ANY(@cart)), @date, @userId)", Connect);
            Command.Parameters.AddWithValue("@cart", NpgsqlTypes.NpgsqlDbType.Array | NpgsqlTypes.NpgsqlDbType.Integer, CartList);
            Command.Parameters.AddWithValue("@date", DateTime.Now);
            Command.Parameters.AddWithValue("@userId", Application["UserId"]);
            DataAdapter = new NpgsqlDataAdapter(Command);
            Command.ExecuteNonQuery();

            Command = new NpgsqlCommand("select max(id) from orders", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            int Orderid = 0;
            using (NpgsqlDataReader rdr = Command.ExecuteReader())
            {
                if (rdr.HasRows)
                {
                    rdr.Read();
                    Orderid = rdr.GetInt32(0);
                }
            }

            foreach (int itemId in CartList)
            {
                Command = new NpgsqlCommand("insert into details(id, product) values(@OrderId, @itemId)", Connect);
                Command.Parameters.AddWithValue("@OrderId", Orderid);
                Command.Parameters.AddWithValue("@itemId", itemId);
                Command.ExecuteNonQuery();
            }

            CartList.Clear();

            Response.Redirect("Cart.aspx?success=" + Orderid);
        }
    }
}