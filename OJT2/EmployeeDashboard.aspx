<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="OJT2.EmployeeDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .card-header {
            background-color: #eee;
            color: #000;
            border-bottom: 0;
            border-radius: 0.25rem 0.25rem 0 0;
        }

        .card-body {
            background-color: #fff;
            border-radius: 0 0 0.25rem 0.25rem;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border-radius: 0.25rem;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0.25rem;
        }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            border-radius: 0.25rem;
        }

            .btn-danger:hover {
                background-color: #c82333;
                border-color: #bd2130;
            }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0 text-center">Update Profile</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="txtName">Name:</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmpName"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtEmail">Email:</label>
                                        <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="txtEmpEmail"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container mt-4">
            <h1 class="text-center">Assigned Leads</h1>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"
                AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit">

                <Columns>

                    <asp:BoundField DataField="LeadName" HeaderText="Name" />
                    <asp:BoundField DataField="LeadEmail" HeaderText="Email" />
                    <asp:BoundField DataField="AssignedDate" HeaderText="Date" />

                    <asp:TemplateField HeaderText="Lead Status">
                        <ItemTemplate>
                            <asp:Label ID="lblLeadStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlLeadStatus" runat="server">
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="LeadContact" HeaderText="Lead Contact" />
                    <asp:BoundField DataField="LeadCity" HeaderText="Lead City" />
                    <asp:BoundField DataField="LeadDescription" HeaderText="Lead Description" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>

            <asp:Panel ID="pnlUpdateLeadStatus" runat="server" Visible="false">

                <div class="container">
                    <h3>Update Lead Status</h3>
                    <div class="form-group">
                        <label for="txtLeadName">Lead Name:</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtLeadName"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlNewStatus">New Status:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlNewStatus">
                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                            <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button runat="server" ID="btnUpdateStatus" Text="Update Status" CssClass="btn btn-primary" OnClick="btnUpdateStatus_Click" />
                    <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                </div>
            </asp:Panel>

        </div>
        <div class="container" id="divUpdateLeadStatus" runat="server" visible="false">
        </div>

        <div class="container mt-4">
            <div class="row justify-content-end">
                <div class="col-md-2">
                    <asp:Button OnClick="btnLogout_Click" runat="server" ID="btnLogout" Text="Logout" CssClass="btn btn-danger w-100" />
                </div>
            </div>
        </div>
    </form>

</body>
</html>
