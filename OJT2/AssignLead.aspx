<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignLead.aspx.cs" Inherits="OJT2.AssignLead" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5 d-flex justify-content-center">
            <div class="row w-75">
                <div class="col-lg-12 col-md-6">
                    <div class="card">
                        <h5 class="card-header">Assign Lead</h5>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="ddlEmployees">Select Employee:</label>
                                <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="-- Select Employee --" Value="-1" />
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="ddlLeads">Select Lead:</label>
                                <asp:DropDownList ID="ddlLeads" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="-- Select Lead --" Value="-1" />
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="ddlStatus">Status:</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="-- Select Status --" Value="-1" />
                                    <asp:ListItem Text="In Progress" Value="InProgress" />
                                    <asp:ListItem Text="Completed" Value="Completed" />
                                    <asp:ListItem Text="Follow Up" Value="FollowUp" />
                                </asp:DropDownList>
                            </div>
                          <%--  <div class="form-group">
                                <label for="txtFollowUpDate">Follow-Up Date:</label>
                                <asp:TextBox ID="txtFollowUpDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>--%>
                            <asp:Button ID="btnAssignLead" runat="server" Text="Assign Lead" CssClass="btn btn-primary" OnClick="btnAssignLead_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
