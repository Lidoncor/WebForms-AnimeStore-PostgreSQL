using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace ISkp
{
    public partial class AdminOrders : System.Web.UI.Page
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

            Command = new NpgsqlCommand("select * from orders", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);

            Connect.Close();

            GridView1.DataSource = DataTable;
            GridView1.DataBind();
        }

        protected void detailsBtn_Click(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            Response.Redirect("OrderDetails.aspx?OrderId=" + argument);
        }

        protected void deleteorderBtn_Click(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            Connect.Open();

            Command = new NpgsqlCommand("delete from orders where id=@id1", Connect);
            Command.Parameters.AddWithValue("@id1", Int32.Parse(argument));
            Command.ExecuteNonQuery();

            Connect.Close();

            Show();
        }

        protected void FindButton_Click(object sender, EventArgs e)
        {
            try
            {
                Connect.Open();

                Command = new NpgsqlCommand("select * from orders where " + valueList.SelectedValue + " = '" + valueText.Text + "'" + " order by id", Connect);
                DataAdapter = new NpgsqlDataAdapter(Command);
                DataTable = new DataTable();
                DataAdapter.Fill(DataTable);

                Connect.Close();

                GridView1.DataSource = DataTable;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                //
            }

        }

        protected void ShowButton_Click(object sender, EventArgs e)
        {
            Show();
        }
    }
}