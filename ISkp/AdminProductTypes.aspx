<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="AdminProductTypes.aspx.cs" Inherits="ISkp.AdminProductTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <br />
            <asp:GridView ID="ProductTypesGridView" runat="server" AutoGenerateColumns="false" class="w-auto table table-dark table-hover" OnRowCancelingEdit="ProductTypesGridView_RowCancelingEdit" OnRowEditing="ProductTypesGridView_RowEditing" OnRowUpdating="ProductTypesGridView_RowUpdating" OnRowDeleting="ProductTypesGridView_RowDeleting" OnRowDataBound="OnRowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="ProductTypeId" runat="server" Text='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Тип продукта">
                        <ItemTemplate>
                            <asp:Label ID="ProductTypeName" runat="server" Text='<%# Eval("name") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ProductTypeNameInput" runat="server" Text='<%# Eval("name") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Активен">
                        <ItemTemplate>
                            <asp:Label ID="Instocklbl" runat="server" Text='<%# Eval("instock") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="InstockListEdit" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Редактировать" ID="Editbutton" runat="server" CommandName="Edit" />
                            <asp:Button Text="Снять" ID="Deletebutton" runat="server" CommandName="Delete" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button Text="Обновить" ID="Updatebutton" runat="server" CommandName="Update" />
                            <asp:Button Text="Отменить" ID="Cancelbutton" runat="server" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="text-white">
                <br />
                <asp:Button ID="NewRecordButton" runat="server" Text="Вставить новую запись" OnClick="NewRecordButton_Click" />

                &nbsp;<asp:Label ID="NewTypeLabel" runat="server" Text="Новый тип продукта:" Visible="False"></asp:Label>
                &nbsp;<asp:TextBox ID="NewType" runat="server" Visible="False"></asp:TextBox>

                &nbsp;<asp:Button ID="InsertButton" runat="server" Text="Вставить" Visible="False" OnClick="InsertButton_Click" />
                &nbsp;<asp:Button ID="CancelButton" runat="server" Text="Отменить" Visible="False" OnClick="CancelButton_Click" />
                <br />
                <br />
                Найти по: 
                <asp:DropDownList ID="valueList" runat="server">
                    <asp:ListItem Value="id"> Id </asp:ListItem>
                    <asp:ListItem Value="name"> Тип продукта </asp:ListItem>
                </asp:DropDownList>
                &nbsp;=&nbsp;
                <asp:TextBox ID="valueText" runat="server" Columns="7"></asp:TextBox>
                &nbsp;<asp:Button ID="findbutton" runat="server" Text="Найти" OnClick="FindButton_Click" />
                &nbsp;<asp:Button ID="showbutton" runat="server" Text="Показать все записи" OnClick="ShowButton_Click" />
                <br />
                <br />
            </div>
        </center>
    </div>
</asp:Content>
