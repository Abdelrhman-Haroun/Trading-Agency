<%@ Page Title="تسجيل الدخول" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <div class="row p-1">
            <div class="col-md-8">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" ValidationGroup="ok" />
            </div>
        </div>


      <div class="row">
          <div class="col-md-8">

           <div class="row p-1">
            <div class="col-md-3">اسم المستخدم</div>
            <div class="col-md-9">
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="اسم المستخدم مطلوب" Font-Bold="True" ForeColor="Red" ValidationGroup="ok">*</asp:RequiredFieldValidator>
            </div>
        </div>
      
         <div class="row p-1">
            <div class="col-md-3">كلمة المرور</div>
            <div class="col-md-9">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="كلمة المرور مطلوبه" Font-Bold="True" ForeColor="Red" ValidationGroup="ok">*</asp:RequiredFieldValidator>
              </div>
        </div>

          <div class="row p-1">
              <div class="col-md-12">
                  <asp:CheckBox ID="ChbRemember" runat="server" />تذكرنى<br />
                  <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
              </div>
        </div>

        <div class="row p-1">
          <div class="col-md-12">
            <asp:Button ID="btnLogin" runat="server" Text="تسجيل الدخول" Class="btn btn-success" ValidationGroup="ok" OnClick="btnLogin_Click"  />
            <asp:Button ID="Button1" runat="server" Text="الغاء" Class="btn btn-danger" OnClick="Button1_Click"/>
          </div>
        </div>
            </div>
        </div>

</asp:Content>
