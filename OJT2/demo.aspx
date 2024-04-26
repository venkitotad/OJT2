<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="OJT2.demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            </ul>
        </div>

        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                </button>
                <span class="navbar-text ml-auto">Logged in as <strong>Admin</strong> |
                    <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" Text="Logout" CssClass="btn btn-danger" />
                </span>
            </nav>

            <!-- Add Leads -->
            <div id="addLeadFormContent" style="display: none">
                <div class="col-md-6 m-auto">
                    <div class="card mt-4">
                        <div class="card-header">
                            Add Leads
                        </div>
                        <div class="card-body">
                            <form id="addLeadForm">
                                <div class="form-group">
                                    <asp:TextBox ID="txtLeadName" runat="server" CssClass="form-control mb-3" placeholder="Name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtLeadEmail" runat="server" CssClass="form-control mb-3" placeholder="Email"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtLeadSource" runat="server" CssClass="form-control mb-3" placeholder="Source"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFollowUp" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-plus"></i>Add Lead
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add Employees -->
            <div id="addEmployeeFormContent" style="display: none">
                <div class="col-md-6 m-auto">
                    <div class="card mt-4">
                        <div class="card-header">
                            Add Employees
                        </div>
                        <div class="card-body">
                            <form id="addEmployeeForm">
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmployeeEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddldept" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="Select" Text="Select Department"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="IT"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="HR"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Account"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Purchase"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmployeePwd" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnCreateEmployee" runat="server" Text="Add Employee" OnClick="btnCreateEmployee_Click" CssClass="btn btn-success" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Assign Leads to Employees -->
            <div id="assignLeadFormContent" style="display: none">
                <div class="col-md-6 m-auto">
                    <div class="card mt-4">
                        <div class="card-header">
                            Assign Leads to Employees
                        </div>
                        <div class="card-body">
                            <form id="assignLeadForm">
                                <div class="form-group">
                                    <select class="form-control" id="leadSelect" required>
                                        <!-- Options will be populated dynamically -->
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" id="employeeSelect" required>
                                        <!-- Options will be populated dynamically -->
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-check"></i>Assign Lead
                                </button>
                            </form>
                        </div>
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
                    $("#addEmployeeFormContent, #assignLeadFormContent").hide();
                });

                $('a[href="#employeesSubmenu"]').on("click", function (e) {
                    e.preventDefault();
                    $("#addEmployeeFormContent").show();
                    $("#addLeadFormContent, #assignLeadFormContent").hide();
                });

                $('a[href="#assignSubmenu"]').on("click", function (e) {
                    e.preventDefault();
                    $("#assignLeadFormContent").show();
                    $("#addLeadFormContent, #addEmployeeFormContent").hide();
                });
            });
        </script>
    </form>
</body>
</html>
