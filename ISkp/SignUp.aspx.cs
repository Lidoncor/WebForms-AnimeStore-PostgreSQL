using System;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using Npgsql;

namespace ISkp
{
    public partial class SignUp : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Command;
        NpgsqlDataAdapter DataAdapter;
        DataSet DataSet;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegistrationButton_Click(object sender, CommandEventArgs e)
        {
            String username = NameRegistration.Text;
            String password = PasswordRegistration.Text;

            Connect.Open();

            Command = new NpgsqlCommand("select * from users where name=@username and password=@password", Connect);
            Command.Parameters.AddWithValue("@username", username);
            Command.Parameters.AddWithValue("@password", password);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataSet = new DataSet();
            DataAdapter.Fill(DataSet, "user");

            if (DataSet.Tables["user"].Rows.Count != 0)
            {
                SignUpState.Visible = true;
                SignUpState.Text = "Такой пользователь уже существует";
                SignUpState.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Command = new NpgsqlCommand("insert into users(name, password, role) values(@username, @password, 'user')", Connect);
                Command.Parameters.AddWithValue("@username", username);
                Command.Parameters.AddWithValue("@password", password);
                Command.ExecuteNonQuery();

                Application["UserRole"] = null;

                Response.Redirect("Default.aspx");
            }

            Connect.Close();
        }
    }
}