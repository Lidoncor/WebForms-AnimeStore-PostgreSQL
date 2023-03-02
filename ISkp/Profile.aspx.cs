using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace ISkp
{
    public partial class Profile : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Сommand;
        NpgsqlDataAdapter DataAdapter;
        DataTable DataTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            var aa = Application["UserRole"];
            if ((string)aa != "user")
            {
                Response.Redirect("Default.aspx");
            }
            if (!Page.IsPostBack)
            {
                Connect.Open();

                Сommand = new NpgsqlCommand("select * from orders where user_id = " + Application["UserId"] + " order by id", Connect);
                DataAdapter = new NpgsqlDataAdapter(Сommand);
                DataTable = new DataTable();
                DataAdapter.Fill(DataTable);

                Connect.Close();

                if (DataTable.Rows.Count == 0)
                {
                    ProfileState.Text = "Заказов нет";
                }
                else
                {
                    ProfileState.Text = "Заказы пользователя " + Application["username"];

                    ProfileGridView.DataSource = DataTable;
                    ProfileGridView.DataBind();
                }
            }
        }

        protected void DetailsButton_Click(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            Response.Redirect("OrderDetails.aspx?OrderId=" + argument);
        }
    }
}