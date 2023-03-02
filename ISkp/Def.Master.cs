using System;
using System.Web.UI.WebControls;

namespace ISkp
{
    public partial class Def : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var UserRole = Application["UserRole"];
            if ((string)UserRole == "admin")
            {
                AdminUsersButton.Visible = true;
                EnterButton.Visible = false;
                ExitButton.Visible = true;
                RegistrationButton.Visible = false;
                AdminOrdersButton.Visible = true;
                AdminProductsButton.Visible = true;
                AdminProductTypesButton.Visible = true;
            }
            else if ((string)UserRole == "user")
            {
                AdminUsersButton.Visible = false;
                EnterButton.Visible = false;
                ExitButton.Visible = true;
                RegistrationButton.Visible = false;
                AdminOrdersButton.Visible = false;
                AdminProductsButton.Visible = false;
                AdminProductTypesButton.Visible = false;
                ProfileButton.Visible = true;
            }
            Application["genreOn"] = null;
        }

        protected void ExitButton_Click(object sender, CommandEventArgs e)
        {
            AdminUsersButton.Visible = false;
            AdminOrdersButton.Visible = false;
            AdminProductsButton.Visible = false;
            AdminProductTypesButton.Visible = false;
            EnterButton.Visible = true;
            ExitButton.Visible = false;
            ProfileButton.Visible = false;
            RegistrationButton.Visible = true;

            Application["UserRole"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}