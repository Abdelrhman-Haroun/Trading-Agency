<%@ Page Title="فئات الاصناف" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="WebApplication2.categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <div class="row">
                <a href="newCategory.aspx" class="btn btn-primary mb-1">جديد</a>
             </div>
                <asp:GridView ID="grd" runat="server" class="table table-striped table-hover" OnRowDataBound="grd_RowDataBound1" OnRowDeleting="grd_RowDeleting">
                    <Columns>
                        <asp:HyperLinkField HeaderText="تعديل" Text="تعديل" DataNavigateUrlFields="CategoryID" DataNavigateUrlFormatString="updateCategory.aspx?id={0}" />
                        <asp:ButtonField CommandName="Delete" HeaderText="حذف" ShowHeader="True" Text="حذف" />
                    </Columns>
            </asp:GridView>
            
        </asp:View>
        <asp:View ID="View2" runat="server">
            <h3>هل تريد حذف الفئة <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label> ؟</h3>
            <p>
                <asp:Button ID="btnDelete" class="btn btn-success" runat="server" Text="حذف" OnClick="btnDelete_Click" />
                <asp:Button ID="btnCancel" class="btn btn-danger" runat="server" Text="الغاء" OnClick="btnCancel_Click" />
            </p>
            <p>
                <asp:HiddenField ID="hf" runat="server" />
            </p>
        </asp:View>
    </asp:MultiView>
</asp:Content>
