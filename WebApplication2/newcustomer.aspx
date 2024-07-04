<%@ Page Title="عميل جديد" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="newcustomer.aspx.cs" Inherits="WebApplication2.newcustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td colspan="3" style="font-weight: 700;font-size:x-large;text-align:center">عميل جديد<br />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="save" />
            </td>
        </tr>
        <tr>
            <td>الكود</td>
            <td>
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerID" ErrorMessage="الكود مطلوب" ForeColor="Red" ValidationGroup="save">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="كود العميل مستخدم من قبل" ControlToValidate="txtCustomerID" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="save">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>الشركة</td>
            <td ><asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="اسم الشركة مطلوب" ForeColor="Red" ControlToValidate="txtCompanyName" ValidationGroup="save">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>الاسم </td>
            <td>
                <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactName" ErrorMessage="اسم العميل مطلوب" ForeColor="Red" ValidationGroup="save">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="اسم العميل مستخدم من قبل" ControlToValidate="txtContactName" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="save">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>اللقب</td>
            <td>
                <asp:TextBox ID="txtContactTitle" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>العنوان</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>المدينة</td>
            <td>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>الاقليم</td>
            <td>
                <asp:TextBox ID="txtRegion" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>الرقم البريدي</td>
            <td>
                <asp:TextBox ID="txtPostCode" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>الدولة</td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>الهاتف</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>الفاكس</td>
            <td>
                <asp:TextBox ID="txtFax" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn btn-primary" ValidationGroup="save" OnClick="btnSave_Click" />
                <asp:Button ID="btnBack" runat="server" class="btn btn-danger" Text="الغاء" OnClick="btnBack_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
