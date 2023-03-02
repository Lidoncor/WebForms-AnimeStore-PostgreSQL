using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using Npgsql;

namespace ISkp
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Command;
        NpgsqlDataAdapter DataAdapter;
        DataTable DataTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            var aa = Application["UserRole"];
            if ((string)aa == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                Connect.Open();

                Command = new NpgsqlCommand(@"select product.picture, product.name, product.price
                                              from product, orders, details
                                              where details.id = orders.id
                                              and product.id = details.product
                                              and orders.id =" + Request.QueryString["OrderId"], Connect);
                DataAdapter = new NpgsqlDataAdapter(Command);
                DataTable = new DataTable();
                DataAdapter.Fill(DataTable);

                Connect.Close();

                ProfileDetailsGridView.DataSource = DataTable;
                ProfileDetailsGridView.DataBind();
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            if ((string)Application["UserRole"] == "admin")
            {
                Response.Redirect("adminOrders.aspx");
            }
            else if ((string)Application["UserRole"] == "user")
            {
                Response.Redirect("Profile.aspx");
            }
        }
    }
}