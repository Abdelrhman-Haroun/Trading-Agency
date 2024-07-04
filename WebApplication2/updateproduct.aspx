<%@ Page Title="تعديل بيانات صنف" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="updateproduct.aspx.cs" Inherits="WebApplication2.updateproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <table>
        <tr>
            <td colspan="3" style="font-weight: 700;font-size:x-large;text-align:center">تعديل صنف<br />
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
                <asp:TextBox ID="txtProductID" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>

        <tr>
            <td>الاسم </td>
            <td>
                <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactName" ErrorMessage="اسم الصنف مطلوب" ForeColor="Red" ValidationGroup="save">*</asp:RequiredFieldValidator>
            </td>
        </tr>
      <tr>
            <td>المورد</td>
            <td>
                <asp:DropDownList ID="ddlSupplier" runat="server"></asp:DropDownList>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td>الفئة</td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td>السعر</td>
            <td>
                <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>


        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn btn-primary" ValidationGroup="save" OnClick="btnSave_Click" />
                <asp:Button ID="btnBack" runat="server" class="btn btn-danger" Text="الغاء" OnClick="btnBack_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
