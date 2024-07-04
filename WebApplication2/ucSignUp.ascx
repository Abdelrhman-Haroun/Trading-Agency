<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSignUp.ascx.cs" Inherits="WebApplication2.ucSignUp" %>

      <div class="row">
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
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="هذا الاسم مستخدم من قبل" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="ok">*</asp:CustomValidator>
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
            <div class="col-md-3">تاكيد كلمة المرور</div>
            <div class="col-md-9">
                <asp:TextBox ID="txtConfirme" runat="server" TextMode="Password" Width="187px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirme" ErrorMessage="تاكيد كلمه المرور مطلوب" Font-Bold="True" ForeColor="Red" ValidationGroup="ok">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirme" ErrorMessage="كلمة المرور غير متطابقه" Font-Bold="True" ForeColor="Red" ValidationGroup="ok">*</asp:CompareValidator>
            </div>
        </div>

       <div class="row p-1">
            <div class="col-md-3">العنوان</div>
            <div class="col-md-9">
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></div>
        </div>

        <div class="row p-1">
            <div class="col-md-3">الهاتف</div>
            <div class="col-md-9">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></div>
        </div>
         
        <div class="row p-1">
            <div class="col-md-3">الايميل</div>
            <div class="col-md-9">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="صيغة الايميل غير صحيحه" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ok">*</asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="هذا الايميل مستخدم من قبل" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="ok">*</asp:CustomValidator>
            </div>
        </div>
        <div class="row p-1">
          <div class="col-md-12">
            <asp:Button ID="btnSignUp" runat="server" Text="اشتراك" Class="btn btn-success" ValidationGroup="ok" OnClick="btnSignUp_Click" />
            <asp:Button ID="Button1" runat="server" Text="الغاء" Class="btn btn-danger" OnClick="Button1_Click" />
          </div>
        </div>


    </div>
    <div class="col-md-4">
        <img src="Images/sign-up.jpg" class="img-fluid" style="height: 344px" />
    </div>
</div>