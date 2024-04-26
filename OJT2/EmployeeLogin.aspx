<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeLogin.aspx.cs" Inherits="OJT2.EmployeeLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="path/to/sweetalert.min.js"></script>


    <div class="d-flex justify-content-center mt-5 min-vh-100">
        <div class="page-content page-container" id="page-content">
            <div class="padding">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header"><strong>Login to your account</strong></div>
                            <div class="card-body">

                                <div class="form-group">
                                    <label class="text-muted" for="txtEmail">Email address</label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control mb-3" placeholder="Username"></asp:TextBox>
                                    <!-- Added mb-3 for bottom margin -->
                                </div>
                                <div class="form-group">
                                    <label class="text-muted" for="txtPassword">Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    <!-- Added mb-3 for bottom margin -->
                                </div>
                                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-block" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>






</asp:Content>
