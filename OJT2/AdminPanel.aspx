<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="OJT2.AdminPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>


    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

    <!-- SweetAlert2 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>


    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }

        #sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #f8f9fa;
            color: #000000;
            transition: all 0.3s;
            overflow-y: auto;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        #content {
            margin-left: 250px;
            transition: all 0.3s;
        }

        .navbar {
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .nav-link {
            color: #000000;
        }

            .nav-link:hover {
                color: #007bff;
            }

        .collapse.show {
            display: block;
        }

        .navbar-text {
            color: #000000;
        }

        #sidebar .list-unstyled > li > a:hover,
        #sidebar .list-unstyled > li > a.active {
            background-color: #495057;
        }

        .card-header {
            background-color: #eee;
            color: #000;
        }

        .card-footer {
            background-color: #f9f9f9;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

            .form-control:focus {
                border-color: #007BFF;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

        .btn-primary,
        .btn-success {
            transition: background-color 0.3s, border-color 0.3s;
        }

            .btn-primary:hover,
            .btn-success:hover {
                opacity: 0.9;
            }

        .navbar {
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        /* Custom styles */
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="sidebar">
            <h2 class="text-center my-4"><i class="fas fa-cogs"></i></h2>
            <ul class="nav flex-column components">
                <li class="nav-item">
                    <a class="nav-link" href="#leadsSubmenu" data-toggle="collapse" aria-expanded="false">Add Leads</a>
                    <div class="collapse" id="leadsSubmenu">
                    </div>
                    <hr />
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#employeesSubmenu" data-toggle="collapse" aria-expanded="false">Employees</a>
                    <div class="collapse" id="employeesSubmenu">
                    </div>
                    <hr />
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#assignSubmenu" data-toggle="collapse" aria-expanded="false">Assign Leads</a>
                    <div class="collapse" id="assignSubmenu">
                    </div>
                    <hr />
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#viewReport" data-toggle="collapse" aria-expanded="false">View reprot</a>
                    <div class="collapse" id="Report">
                    </div>
                    <hr />
                </li>
            </ul>
        </div>



        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                </button>
                <span class="navbar-text ml-auto">Logged in as <strong>Admin</strong> |
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" Text="Logout" CssClass="btn btn-danger" CausesValidation="false" />

                </span>
            </nav>

            <div class="container mt-4">
                <div class="row justify-content-center">
                    <!-- Total Lead Count -->
                    <div class="col-md-6">
                        <div class="card border-primary shadow">
                            <div class="card-header bg-primary text-white">
                                Total Lead Count
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblTotalLeads" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- Total Employees Count -->
                    <div class="col-md-6">
                        <div class="card border-success shadow">
                            <div class="card-header bg-success text-white">
                                Total Employees Count
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblTotalEmployees" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add Leads -->
            <div id="addLeadFormContent" style="display: none">
                <div class="col-md-6 mx-auto">
                    <div class="card mt-4">
                        <div class="card-header">
                            Add Leads
                        </div>
                        <div class="card-body">

                            <div class="form-group">
                                <asp:TextBox ID="txtLeadName" runat="server" CssClass="form-control mb-3" placeholder="Name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtLeadEmail" runat="server" CssClass="form-control mb-3" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtLeadContact" runat="server" CssClass="form-control mb-3" placeholder="Phone"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtLeadSource" runat="server" CssClass="form-control mb-3" placeholder="Source"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtLeadDescription" runat="server" CssClass="form-control mb-3" placeholder="Description"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlLeadCity" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Select" Text="Select City"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Banglore"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Kolhapur"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Dehli"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Pune"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:Button ID="AddLead" runat="server" Text="Add Lead" OnClick="AddLead_Click" CssClass="btn btn-success" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Add Employees -->
        <div id="addEmployeeFormContent" style="display: none">
            <div class="col-md-6 mx-auto">
                <div class="card mt-4">
                    <div class="card-header">
                        Add Employees
                    </div>
                    <div class="card-body">

                        <div class="form-group">
                            <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEmployeeEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txtEmployeePhone" runat="server" CssClass="form-control" placeholder="Contact(Phone)"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="txtEmployeePwd" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnCreateEmployee" runat="server" Text="Add Employee" OnClick="btnCreateEmployee_Click" OnClientClick="validEmployeeFeild()" CssClass="btn btn-success" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Assign Leads to Employees -->
        <div id="assignLeadFormContent" style="display: none">
            <div class="col-md-6 mx-auto">
                <div class="card mt-4">
                    <div class="card-header">
                        Assign Leads to  Employees
                    </div>

                    <div class="card-body">
                        <form id="assignLeadForm">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlLead" runat="server" CssClass="form-control">
                                    <%-- <select class="form-control" id="leadSelect" required>
                                            <!-- Options will be populated dynamically -->
                                        </select>--%>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlLeadStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Select" Text="Select Status"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="pending"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="in progress"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="completed"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:DropDownList ID="ddlEmp" runat="server" CssClass="form-control">
                                    <%--<select class="form-control" id="employeeSelect" required>
                                          <!-- Options will be populated dynamically -->
                                                </select>--%>
                                </asp:DropDownList>

                            </div>

                            <%--     <div class="form-group">
                                <asp:TextBox ID="txtAssignedDate" TextMode="Date" runat="server" Text="Follow Up" CssClass="form-control" />
                            </div>--%>




                            <asp:Button ID="btnAssignLead" runat="server" Text="Assign Lead" CssClass="btn btn-success" OnClick="btnAssignLead_Click" />


                            <div id="viewReport" style="display: none">
                                <div class="container mt-4">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-10">
                                            <h2 class="text-center mb-4">Employees and Their Leads</h2>
                                            <asp:GridView ID="GridViewEmployees" runat="server" CssClass="table table-striped" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                                                    <asp:BoundField DataField="EmployeeEmail" HeaderText="Employee Email" />
                                                    <asp:TemplateField HeaderText="Assigned Leads">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssignedLeads" runat="server" Text='<%# Bind("AssignedLeads") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script>
            $(document).ready(function () {
                $("#sidebarCollapse").on("click", function () {
                    $("#sidebar, #content").toggleClass("collapsed");
                });

                $(".dropdown-toggle").on("click", function (e) {
                    var submenu = $(this).next(".collapse");
                    if (submenu.length) {
                        e.preventDefault();
                        submenu.toggleClass("show");
                    }
                });

                $('a[href="#leadsSubmenu"]').on("click", function (e) {
                    e.preventDefault();
                    $("#addLeadFormContent").show();
                    $("#addEmployeeFormContent, #assignLeadFormContent, #viewReport").hide();
                });

                $('a[href="#employeesSubmenu"]').on("click", function (e) {
                    e.preventDefault();
                    $("#addEmployeeFormContent").show();
                    $("#addLeadFormContent, #assignLeadFormContent, #viewReport").hide();
                });

                $('a[href="#assignSubmenu"]').on("click", function (e) {
                    e.preventDefault();
                    $("#assignLeadFormContent").show();
                    $("#addLeadFormContent, #addEmployeeFormContent, #viewReport").hide();
                });

                $('a[href="#viewReport"]').on("click", function (e) {
                    e.preventDefault();
                    $("#viewReport").show();
                    $("#addLeadFormContent, #addEmployeeFormContent, #assignLeadFormContent").hide();
                });
            });

            function validEmployeeField() {

                var isLogout = $('#<%= btnLogout.ClientID %>').is(':submit');
                if (isLogout) {
                    return true; // Skip validation for logout button
                }

                // Reset error messages
                $('.error').text('');

                // Get input values
                var employeeName = $('#<%= txtEmployeeName.ClientID %>').val().trim();
                var employeeEmail = $('#<%= txtEmployeeEmail.ClientID %>').val().trim();
                var employeePhone = $('#<%= txtEmployeePhone.ClientID %>').val().trim();
                var employeePwd = $('#<%= txtEmployeePwd.ClientID %>').val().trim();

                var isValid = true;

                // Function to validate phone number format
                function isValidPhone(phone) {
                    var phoneRegex = /^\d{10}$/;
                    return phoneRegex.test(phone);
                }

                // Function to validate email format
                function isValidEmail(email) {
                    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    return emailRegex.test(email);
                }


                if (employeeName === '' && employeeEmail === '' && employeePhone === '' && employeePwd === '') {
                    showError('Enter valid details');
                    isValid = false;
                    return isValid; // Return here to prevent further validation
                }

                // Validate name
                if (employeeName === '') {
                    showError('Employee Name is empty');
                    isValid = false;
                }

                // Validate email
                if (employeeEmail === '') {
                    showError('Email is required');
                    isValid = false;
                } else if (!isValidEmail(employeeEmail)) {
                    showError('Enter a valid email');
                    isValid = false;
                }


                // Validate phone
                if (employeePhone === '') {
                    showError('Phone is required');
                    isValid = false;
                } else if (!isValidPhone(employeePhone)) {
                    showError('Enter a valid 10-digit phone number');
                    isValid = false;
                }

                // Validate password
                if (employeePwd === '') {
                    showError('Password is required');
                    isValid = false;
                }

                return isValid;
            }

            // Function to validate email format
            function isValidEmail(email) {
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return emailRegex.test(email);
            }

            // Function to show error message using SweetAlert
            function showError(message) {
                swal({
                    title: "Error",
                    text: message,
                    icon: "error",
                    button: "OK",
                });
            }

            /*             Function to submit the form after validation*/
            $(document).ready(function () {
                $('#form1').submit(function () {
                    return validEmployeeField();
                });
            });





        </script>

    </form>
</body>
</html>
