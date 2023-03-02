using System;
using System.Data;
using System.Collections;
using System.Web.UI.WebControls;
using Npgsql;
using System.Configuration;

namespace ISkp
{
    public partial class Default : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Command;
        NpgsqlDataAdapter DataAdapter;
        DataTable DataTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            Connect.Open();

            if (Application["genreOn"] == null)
            {
                Command = new NpgsqlCommand("select * from product where instock=true order by id", Connect);
                DataAdapter = new NpgsqlDataAdapter(Command);
                DataTable = new DataTable();
                DataAdapter.Fill(DataTable);

                MainListView.DataSource = DataTable;
                MainListView.DataBind();
            }

            Command = new NpgsqlCommand("select * from type where instock=true order by id", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);

            ProductTypeListView.DataSource = DataTable;
            ProductTypeListView.DataBind();

            Connect.Close();
        }

        protected void ProductType_Click(object sender, CommandEventArgs e)
        {
            Connect.Open();

            Command = new NpgsqlCommand("select * from product where instock=true and type=@TypeId order by id", Connect);
            Command.Parameters.AddWithValue("@TypeId", Int32.Parse((string)e.CommandArgument));
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);
            MainListView.DataSource = DataTable;
            MainListView.DataBind();

            Connect.Close();

            Application["genreOn"] = true;
        }

        protected void ShowAll_Click(object sender, CommandEventArgs e)
        {
            Connect.Open();

            Command = new NpgsqlCommand("select * from product where instock=true order by id", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);
            MainListView.DataSource = DataTable;
            MainListView.DataBind();

            Connect.Close();
        }

        protected void AddToCart_Click(object sender, CommandEventArgs e)
        {
            var UserRole = Application["UserRole"];
            if ((string)UserRole == null)
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