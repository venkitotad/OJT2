// Inside EmployeeLogin.aspx.cs

using System;
using System.Configuration;
using System.Data.SqlClient;

namespace OJT2
{
    public partial class EmployeeLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Employees WHERE EmployeeEmail = @EmployeeEmail AND EmployeePwd = @EmployeePwd", con);
            cmd.Parameters.AddWithValue("@EmployeeEmail", txtUsername.Text);
            cmd.Parameters.AddWithValue("@EmployeePwd", txtPassword.Text);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                Session["EmployeeId"] = sdr.GetValue(0);
                Response.Redirect("EmployeeDashboard.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Invalid Login..!','','error');", true);
            }
            con.Close();
        }
    }
}
