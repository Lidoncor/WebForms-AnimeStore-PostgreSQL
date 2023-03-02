using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace ISkp
{
    public partial class AdminUsers : System.Web.UI.Page
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

            Command = new NpgsqlCommand("select * from users order by id", Connect);
            DataAdapter = new NpgsqlDataAdapter(Command);
            DataTable = new DataTable();
            DataAdapter.Fill(DataTable);

            Connect.Close();

            AdminUsersGridView.DataSource = DataTable;
            AdminUsersGridView.DataBind();
        }

        protected void AdminUsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            AdminUsersGridView.EditIndex = e.NewEditIndex;
            Show();
        }

        protected void AdminUsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            AdminUsersGridView.EditIndex = -1;
            Show();
        }

        protected void AdminUsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Id = AdminUsersGridView.Rows[e.RowIndex].FindControl("UserId") as Label;
            TextBox UsernameInput = AdminUsersGridView.Rows[e.RowIndex].FindControl("UsernameInput") as TextBox;
            TextBox PasswordInput = AdminUsersGridView.Rows[e.RowIndex].FindControl("PasswordInput") as TextBox;
            DropDownList RoleInput = AdminUsersGridView.Rows[e.RowIndex].FindControl("RoleInput") as DropDownList;

            Connect.Open();

            Command = new NpgsqlCommand("update users set name=@username, password=@password, role=@role where ID=@idparam", Connect);
            Command.Parameters.AddWithValue("@idparam", Int32.Parse(Id.Text));
            Command.Parameters.AddWithValue("@username", UsernameInput.Text);
            Command.Parameters.AddWithValue("@password", PasswordInput.Text);
            Command.Parameters.AddWithValue("@role", RoleInput.SelectedItem.ToString());
            Command.ExecuteNonQuery();

            Connect.Close();

            AdminUsersGridView.EditIndex = -1;

            Show();
        }

        protected void AdminUsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label Id = AdminUsersGridView.Rows[e.RowIndex].FindControl("UserId") as Label;

            Connect.Open();

            Command = new NpgsqlCommand("delete from orders where user_id = @id1", Connect);
            Command.Parameters.AddWithValue("@id1", Int32.Parse(Id.Text));
            Command.ExecuteNonQuery();

            Command = new NpgsqlCommand("delete from users where id=@id1", Connect);
            Command.Parameters.AddWithValue("@id1", Int32.Parse(Id.Text));
            Command.ExecuteNonQuery();

            Connect.Close();

            Show();
        }

        protected void FindButton_Click(object sender, EventArgs e)
        {
            try
            {
                Connect.Open();

                Command = new NpgsqlCommand("select * from users where " + valueList.SelectedValue + " = '" + valueText.Text + "'", Connect);
                DataAdapter = new NpgsqlDataAdapter(Command);
                DataTable = new DataTable();
                DataAdapter.Fill(DataTable);

                Connect.Close();

                AdminUsersGridView.DataSource = DataTable;
                AdminUsersGridView.DataBind();
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

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && AdminUsersGridView.EditIndex == e.Row.RowIndex)
            {
                DropDownList RoleInput = (e.Row.FindControl("RoleInput") as DropDownList);
                RoleInput.Items.Add(new ListItem("user", "user"));
                RoleInput.Items.Add(new ListItem("admin", "admin"));

                string selected = DataBinder.Eval(e.Row.DataItem, "role").ToString().ToLower();
                RoleInput.Items.FindByText(selected).Selected = true;
            }
        }
    }
}