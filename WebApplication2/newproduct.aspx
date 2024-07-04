<%@ Page Title="صنف جديد" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="newproduct.aspx.cs" Inherits="WebApplication2.newproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <table>
        <tr>
            <td colspan="3" style="font-weight: 700;font-size:x-large;text-align:center">صنف جديد<br />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="save" />
            </td>
        </tr>


        <tr>
            <td>الاسم </td>
            <td>
                <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProductName" ErrorMessage="اسم الصنف مطلوب" ForeColor="Red" ValidationGroup="save">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="اسم الصنف مستخدم من قبل" ControlToValidate="txtProductName" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="save">*</asp:CustomValidator>
            </td>
        </tr>
      <tr>
            <td>المورد</td>
            <td>
                <asp:DropDownList ID="ddlSupplier" runat="server"></asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>الفئة</td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>السعر</td>
            <td>
                <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUnitPrice" ErrorMessage="السعر مطلوب" ForeColor="Red" ValidationGroup="save">*</asp:RequiredFieldValidator>
            </td>
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
