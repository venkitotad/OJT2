<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OJT2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <h1 class="display-4">Lead Management System</h1>
                    <p class="lead">Manage leads efficiently with Lead Management system.</p>
                    <asp:Button runat="server" ID="btnLearnMore" CssClass="btn btn-primary btn-lg" OnClick="btnLearnMore_Click" Text="Learn More" />
                </div>
                <div class="col-md-6">
                    <img src="images/Home.jpg" alt="Lead Management Image" class="img-fluid rounded shadow-sm" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>
