using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OJT2
{
    public partial class demoEMP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind assigned leads to the GridView
                BindAssignedLeads();
            }

        }

        protected void BindAssignedLeads()
        {
            // Get the EmployeeID of the logged-in user
            string loggedInUsername = User.Identity.Name; // Assuming you're using ASP.NET Forms Authentication
            int employeeID = GetEmployeeID(loggedInUsername);

            // Define connection string
            string connectionString = @"Data Source=VENKI\SQLEXPRESS02;Initial Catalog=LeadDB;Integrated Security=True";

            // SQL query to retrieve assigned leads along with lead details
            string query = @"SELECT LA.[AssignmentID], LA.[LeadID], LA.[EmployeeID], LA.[AssignedDate], LA.[Status], L.[LeadName], L.[LeadEmail], L.[LeadContact], L.[LeadSource], L.[LeadDescription], L.[LeadCity]
                     FROM [LeadDB].[dbo].[LeadAssignment] LA
                     INNER JOIN [LeadDB].[dbo].[Leads] L ON LA.[LeadID] = L.[LeadID]
                     WHERE LA.[EmployeeID] = @EmployeeID";

            // Create SqlConnection and SqlCommand
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters
                    command.Parameters.AddWithValue("@EmployeeID", employeeID);

                    // Open the connection
                    connection.Open();

                    // Execute the command and read the data
                    SqlDataReader reader = command.ExecuteReader();

                    // Bind data to the GridView
                    GridView1.DataSource = reader;
                    GridView1.DataBind();

                    // Close the reader and connection
                    reader.Close();
                    connection.Close();
                }
            }
        }


        // Method to retrieve EmployeeID based on username
        protected int GetEmployeeID(string username)
        {
            int employeeID = -1; // Default value in case employee ID is not found

            // Define connection string
            string connectionString = @"Data Source=VENKI\SQLEXPRESS02;Initial Catalog=LeadDB;Integrated Security=True";

            // SQL query to retrieve EmployeeID based on username
            string query = @"SELECT [EmployeeId] FROM [LeadDB].[dbo].[Employees] WHERE [EmployeeEmail] = @Username";

            // Create SqlConnection and SqlCommand
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters
                    command.Parameters.AddWithValue("@Username", username);

                    // Open the connection
                    connection.Open();

                    // Execute the command and get the EmployeeID
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        employeeID = Convert.ToInt32(result);
                    }

                    // Close the connection
                    connection.Close();
                }
            }

            return employeeID;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Update the lead status here
            // You can access the updated lead status from the DropDownList in the GridView
            // and perform any necessary database operations to update the status
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }
    }
}