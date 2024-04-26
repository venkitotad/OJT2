<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demoEMP.aspx.cs" Inherits="OJT2.demoEMP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="text-center">Assigned Leads</h1>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"
                AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="LeadName" HeaderText="Name" />
                    <asp:BoundField DataField="LeadEmail" HeaderText="Email" />
                    <asp:BoundField DataField="AssignedDate" HeaderText="Date" />
                    <asp:BoundField DataField="LeadSource" HeaderText="Lead Source" />
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
            <div class="text-center mt-3">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" OnClick="btnLogout_Click" />
            </div>


        </div>


    </form>
</body>
</html>
