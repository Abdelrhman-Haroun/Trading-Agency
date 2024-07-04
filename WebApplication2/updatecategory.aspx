<%@ Page Title="تعديل بيانات فئة اصناف" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="updatecategory.aspx.cs" Inherits="WebApplication2.updatecategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <table>
        <tr>
            <td colspan="3" style="font-weight: 700;font-size:x-large;text-align:center">تعديل فئة اصناف<br />
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
                <asp:TextBox ID="txtCategoryID" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryID" ErrorMessage="الكود مطلوب" ForeColor="Red" ValidationGroup="save">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>اسم الفئة</td>
            <td>
                <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactName" ErrorMessage="اسم الفئة مطلوب" ForeColor="Red" ValidationGroup="save">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>الوصف</td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
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
