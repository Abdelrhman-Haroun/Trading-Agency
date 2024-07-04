<%@ Page Title="اشتراك" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="WebApplication2.signup" %>
<%@ Register src="ucSignUp.ascx" tagname="ucSignUp" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucSignUp ID="ucSignUp1" runat="server" />
</asp:Content>
