<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddLead.aspx.cs" Inherits="OJT2.AddLead1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

                        <asp:Button ID="AddLead" runat="server" Text="Add Lead" CssClass="form-control btn btn-success" OnClick="AddLead_Click"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
