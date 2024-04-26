using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace OJT2
{
    public partial class AssignLead : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch and bind employees to the dropdown
                BindEmployees();

                // Fetch and bind leads to the dropdown
                BindLeads();
            }
        }

        protected void btnAssignLead_Click(object sender, EventArgs e)
        {
            // Handle lead assignment logic here
            // Get selected employee, lead, status, follow-up date, etc.
            // Perform lead assignment operations
        }

        private void BindEmployees()
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                string query = "SELECT EmployeeID, Name FROM Employees";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ddlEmployees.DataSource = reader;
                ddlEmployees.DataTextField = "Name";
                ddlEmployees.DataValueField = "EmployeeID";
                ddlEmployees.DataBind();

                ddlEmployees.Items.Insert(0, new ListItem("-- Select Employee --", "-1"));
            }
        }

        private void BindLeads()
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                string query = "SELECT LeadID, Name FROM Leads";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ddlLeads.DataSource = reader;
                ddlLeads.DataTextField = "Name";
                ddlLeads.DataValueField = "LeadID";
                ddlLeads.DataBind();

                ddlLeads.Items.Insert(0, new ListItem("-- Select Lead --", "-1"));
            }
        }
    }
}
