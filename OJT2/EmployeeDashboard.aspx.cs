using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OJT2
{
    public partial class EmployeeDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployeeDetails();
                BindAssignedLeads();
            }
        }

        protected void LoadEmployeeDetails()
        {
            if (Session["EmployeeId"] != null)
            {
                con.Open();
                SqlCommand empCmd = new SqlCommand("SELECT EmployeeName, EmployeeEmail FROM Employees WHERE EmployeeId = @empid", con);
                empCmd.Parameters.AddWithValue("@empid", Session["EmployeeId"]);
                SqlDataReader empReader = empCmd.ExecuteReader();
                if (empReader.Read())
                {
                    txtEmpName.Text = empReader["EmployeeName"].ToString();
                    txtEmpEmail.Text = empReader["EmployeeEmail"].ToString();
                }
                empReader.Close();
                con.Close();
            }
            else
            {
                Response.Redirect("EmployeeLogin.aspx");
            }
        }

        protected void BindAssignedLeads()
        {
            int employeeID = Convert.ToInt32(Session["EmployeeId"]);
            string connectionString = @"Data Source=VENKI\SQLEXPRESS02;Initial Catalog=LeadDB;Integrated Security=True";
            string query = @"SELECT LA.[AssignmentID], LA.[LeadID], LA.[EmployeeID], LA.[AssignedDate], LA.[Status], L.[LeadName], L.[LeadEmail], L.[LeadContact], L.[LeadSource], L.[LeadDescription], L.[LeadCity]
                     FROM [LeadDB].[dbo].[LeadAssignment] LA
                     INNER JOIN [LeadDB].[dbo].[Leads] L ON LA.[LeadID] = L.[LeadID]
                     WHERE LA.[EmployeeID] = @EmployeeID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                    reader.Close();
                    connection.Close();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Implement the save logic to update lead status
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("EmployeeLogin.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Get the selected row
            GridViewRow row = GridView1.Rows[e.NewEditIndex];

            // Find the form controls within the selected row
            TextBox txtLeadName = row.FindControl("txtLeadName") as TextBox;
            DropDownList ddlCurrentStatus = row.FindControl("ddlLeadStatus") as DropDownList;

            // Populate the form fields with data from the selected row
            if (txtLeadName != null && ddlCurrentStatus != null)
            {
                txtLeadName.Text = row.Cells[0].Text; // Assuming LeadName is in the first column
                ddlCurrentStatus.SelectedValue = ((Label)row.FindControl("lblLeadStatus")).Text; // Assuming the status is displayed in a Label control
            }

            // Show the form for updating the lead status
            divUpdateLeadStatus.Visible = true; // Assuming you wrap the form in a <div> element with ID "divUpdateLeadStatus"
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Cancel the editing mode of the GridView
            GridView1.EditIndex = -1;
            // Rebind the GridView to refresh the data
            BindAssignedLeads();
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Implement the logic to handle cancel button click event
            // For example, hide the panel or perform any other necessary actions
            pnlUpdateLeadStatus.Visible = false;
        }

    }
}
