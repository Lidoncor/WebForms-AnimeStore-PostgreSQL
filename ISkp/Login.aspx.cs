using System;
using System.Data;
using System.Collections;
using System.Web.UI.WebControls;
using Npgsql;
using System.Configuration;

namespace ISkp
{
    public partial class Login : System.Web.UI.Page
    {
        NpgsqlConnection Connect = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        NpgsqlCommand Command;
        NpgsqlDataAdapter DataAdapter;
        DataSet DataSet;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, CommandEventArgs e)
        {
            String username = UserInput.Text;
            String password = PasswordInput.Text;

            Connect.Open();

            Command = new NpgsqlCommand("select * from users where name=@username and password=@password", Connect);
            Command.Parameters.AddWithValue("@username", username);
            Command.Parameters.AddWithValue("@password", password);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataSet = new DataSet();
            DataAdapter.Fill(DataSet, "user");

            string UserRole = "";
            int UserId = 0;
            if (DataSet.Tables["user"].Rows.Count != 0)
            {
                LoginState.Visible = false;
                using (NpgsqlDataReader rdr = Command.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        rdr.Read();
                        UserId = rdr.GetInt32(0);
                        UserRole = rdr.GetString(3);
                    }
                }
                Connect.Close();

                Application["UserRole"] = UserRole;
                Application["UserId"] = UserId;
                Application["username"] = username;
                Application["CartList"] = new ArrayList();

                Response.Redirect("Default.aspx");
            }
            else
            {
                LoginState.Visible = true;
                LoginState.Text = "Не смогли найти Ваш аккаунт";
                LoginState.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}