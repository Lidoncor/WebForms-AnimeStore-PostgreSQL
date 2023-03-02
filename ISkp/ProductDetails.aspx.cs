using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Collections;
using Npgsql;
using System.Configuration;

namespace ISkp
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Command;
        NpgsqlDataAdapter DataAdapter;
        DataTable DataTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            Connect.Open();

            Command = new NpgsqlCommand("select * from product where id=@ProductId", Connect);
            Command.Parameters.AddWithValue("@ProductId", Int32.Parse(Request.QueryString["ProductId"]));
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);
            DetailsListView.DataSource = DataTable;
            DetailsListView.DataBind();

            Connect.Close();
        }

        protected void AddToCart_Click(object sender, CommandEventArgs e)
        {
            var aa = Application["UserRole"];
            if ((string)aa == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                var UserId = Application["UserId"];
                ArrayList CartList = (ArrayList)Application["CartList"];
                CartList.Add(Int32.Parse((String)e.CommandArgument));
                Response.Redirect("cart.aspx");
            }
        }
    }
}