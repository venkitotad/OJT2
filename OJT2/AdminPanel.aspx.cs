using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace OJT2
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldrop();
                filldropEmp();
            }

            if (!IsPostBack)
            {
                // Populate total lead count
                int totalLeads = GetTotalLeadsCount();
                lblTotalLeads.Text = totalLeads.ToString();

                // Populate total employees count
                int totalEmployees = GetTotalEmployeesCount();
                lblTotalEmployees.Text = totalEmployees.ToString();
            }

            if (!IsPostBack)
            {
                BindGridView();
            }



        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("AdminLogin.aspx");
        }


        private void filldropEmp()
        {
            ddlEmp.DataTextField = "EmployeeName";
            ddlEmp.DataValueField = "EmployeeID";
            ddlEmp.DataSource = getEmpData();
            ddlEmp.DataBind();
        }

        public DataTable getEmpData()
        {
            cmd = new SqlCommand("EmpSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        protected void filldrop()
        {
            ddlLead.DataTextField = "LeadName"; // Assuming "Name" is the field you want to display in the dropdown
            ddlLead.DataValueField = "LeadID"; // Assuming "LeadID" is the unique identifier for each lead
            ddlLead.DataSource = getLeaddata(); // Call getuserdata() method to get the data
            ddlLead.DataBind();


        }

        public DataTable getLeaddata()
        {
            cmd = new SqlCommand("leadSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;

        }



        protected void btnCreateEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                // Open the connection
                con.Open();

                // Define the SQL query with parameters
                string query = "INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePhone, EmployeePwd) VALUES (@employeeName, @employeeEmail, @employeePhone, @employeePwd)";

                // Create a SqlCommand object
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@employeeName", txtEmployeeName.Text);
                    cmd.Parameters.AddWithValue("@employeeEmail", txtEmployeeEmail.Text);
                    cmd.Parameters.AddWithValue("@employeePhone", txtEmployeePhone.Text);
                    cmd.Parameters.AddWithValue("@employeePwd", txtEmployeePwd.Text);

                    ddlEmp.Items.Insert(0, new ListItem("-- Select Employees --", "-1")); ddlEmp.Items.Insert(0, new ListItem("-- Select Employees --", "-1"));

                    // Execute the query
                    int rowsAffected = cmd.ExecuteNonQuery();

                    txtEmployeeName.Text = string.Empty;
                    txtEmployeeEmail.Text = string.Empty;
                    txtEmployeePhone.Text = string.Empty;
                    txtEmployeePwd.Text = string.Empty;


                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Success','Employee created successfully.','success');", true);



                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                // Always close the connection in the finally block to ensure it's closed even if an exception occurs
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }

        protected void btnAssignLead_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO LeadAssignment (LeadID, EmployeeID, AssignedDate, Status) VALUES (@LeadID, @EmployeeID, @AssignedDate, @Status)", con);

            con.Close();
            // Add parameters to the SqlCommand object
            cmd.Parameters.AddWithValue("@LeadID", ddlLead.SelectedValue);
            cmd.Parameters.AddWithValue("@EmployeeID", ddlEmp.SelectedValue);
            cmd.Parameters.AddWithValue("@AssignedDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", ddlLeadStatus.SelectedItem.Text);
            con.Open();

            ddlLead.Items.Insert(0, new ListItem("-- Select Leads --", "-1")); ddlLead.Items.Insert(0, new ListItem("-- Select Leads --", "-1"));




            cmd.ExecuteNonQuery();


            con.Close();



            //string SelectedEmployeeId = ddlEmp.SelectedValue;
            //string SelectedEmployeeName = ddlEmp.SelectedItem.Text;
            //string SelectedLeadId = ddlLead.SelectedValue;
            //string Status = ddlLeadStatus.SelectedValue;
            //string SelectedLeadName = txtLeadName.Text;


            DateTime assignedDate = DateTime.Now;

            //con.Open();

            //SqlCommand cmd1 = new SqlCommand("INSERT INTO LeadAssigns (LeadID, EmployeeID, EmployeeName, LeadName, AssignedDate, Status) VALUES (@LeadID, @EmployeeID, @EmployeeName, @LeadName  @AssignedDate, @Status)", con);
            //cmd1.Parameters.AddWithValue("@LeadID", SelectedLeadId);
            //cmd1.Parameters.AddWithValue("@EmployeeID", SelectedEmployeeId);
            //cmd1.Parameters.AddWithValue("@EmployeeName", SelectedEmployeeName);
            //cmd1.Parameters.AddWithValue("@LeadName", SelectedLeadName);
            //cmd1.Parameters.AddWithValue("@AssignedDate", DateTime.Now);
            //cmd1.Parameters.AddWithValue("@Status", ddlLeadStatus);


            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Success','Lead assigned successfully.','success');", true);



        }

        protected void AddLead_Click(object sender, EventArgs e)
        {

            // Open the connection
            con.Open();

            // Define the SQL query with parameters
            string query = "INSERT INTO Leads (LeadName, LeadEmail, LeadContact, LeadSource, LeadDescription, LeadCity) VALUES (@leadName, @leadEmail, @leadContact, @leadSource, @leadDescription, @leadCity)";

            // Create a SqlCommand object
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Add parameters
                cmd.Parameters.AddWithValue("@leadName", txtLeadName.Text);
                cmd.Parameters.AddWithValue("@leadEmail", txtLeadEmail.Text);
                cmd.Parameters.AddWithValue("@leadContact", txtLeadContact.Text);
                cmd.Parameters.AddWithValue("@leadSource", txtLeadSource.Text);
                cmd.Parameters.AddWithValue("@leadDescription", txtLeadDescription.Text);
                cmd.Parameters.AddWithValue("@leadCity", ddlLeadCity.SelectedItem.Text);

                // Execute the query
                int rowsAffected = cmd.ExecuteNonQuery();

                // Clear input fields
                txtLeadName.Text = string.Empty;
                txtLeadEmail.Text = string.Empty;
                txtLeadContact.Text = string.Empty;
                txtLeadSource.Text = string.Empty;
                txtLeadDescription.Text = string.Empty;
                ddlLeadCity.SelectedIndex = 0; // Reset dropdown to default value


                // Check if any rows were affected
                if (rowsAffected > 0)
                {
                    // Data insertion successful
                    // Show success message using SweetAlert
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Success','Lead created successfully.','success');", true);
                }
                else
                {
                    // No rows affected (insertion failed)
                    // Show error message using SweetAlert
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error','Failed to create lead.','error');", true);
                }
            }




        }

        protected int GetTotalLeadsCount()
        {
            int totalLeads = 0;
            // Connect to your database
            using (SqlConnection connection = new SqlConnection("Data Source=VENKI\\SQLEXPRESS02;Initial Catalog=LeadDB;Integrated Security=True"))
            {
                // Write your SQL query to get total leads count
                string query = "SELECT COUNT(*) FROM Leads";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    // Execute the command and get the total count
                    totalLeads = (int)command.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                }
            }
            return totalLeads;
        }

        protected int GetTotalEmployeesCount()
        {
            int totalEmployees = 0;
            // Connect to your database
            using (SqlConnection connection = new SqlConnection("Data Source=VENKI\\SQLEXPRESS02;Initial Catalog=LeadDB;Integrated Security=True"))
            {
                // Write your SQL query to get total employees count
                string query = "SELECT COUNT(*) FROM Employees";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    // Execute the command and get the total count
                    totalEmployees = (int)command.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                }
            }
            return totalEmployees;
        }


        protected void BindGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            string query = "SELECT E.EmployeeName, E.EmployeeEmail, " +
                           "STUFF((SELECT ', ' + L.LeadName FROM LeadAssignment LA " +
                           "INNER JOIN Leads L ON LA.LeadID = L.LeadID " +
                           "WHERE LA.EmployeeID = E.EmployeeID FOR XML PATH('')), 1, 2, '') AS AssignedLeads " +
                           "FROM Employees E";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        GridViewEmployees.DataSource = dataTable;
                        GridViewEmployees.DataBind();
                    }
                }
            }
        }




    }
}







