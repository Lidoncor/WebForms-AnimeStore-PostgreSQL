<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="ISkp.AdminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <br />
            <asp:GridView ID="AdminUsersGridView" runat="server" AutoGenerateColumns="false" class="w-auto table table-dark table-hover" OnRowCancelingEdit="AdminUsersGridView_RowCancelingEdit" OnRowEditing="AdminUsersGridView_RowEditing" OnRowUpdating="AdminUsersGridView_RowUpdating" OnRowDeleting="AdminUsersGridView_RowDeleting" OnRowDataBound="OnRowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="UserId" runat="server" Text='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Пользователь">
                        <ItemTemplate>
                            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("name") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="UsernameInput" runat="server" Text='<%# Eval("name") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Пароль">
                        <ItemTemplate>
                            <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("password") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="PasswordInput" runat="server" Text='<%# Eval("password") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Роль">
                        <ItemTemplate>
                            <asp:Label ID="RoleLabel" runat="server" Text='<%# Eval("role") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="RoleInput" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Редактировать" ID="Editbutton" runat="server" CommandName="Edit" />
                            <asp:Button Text="Удалить" ID="Deletebutton" runat="server" CommandName="Delete" />
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
                Найти по: 
                <asp:DropDownList ID="valueList" runat="server">
                    <asp:ListItem Value="id"> Id </asp:ListItem>
                    <asp:ListItem Value="name"> Пользователь </asp:ListItem>
                    <asp:ListItem Value="role"> Роль </asp:ListItem>
                </asp:DropDownList>
                &nbsp;=&nbsp;
                <asp:TextBox ID="valueText" runat="server" Columns="7"></asp:TextBox>
                &nbsp;<asp:Button ID="findbutton" runat="server" Text="Найти" OnClick="FindButton_Click" />
                &nbsp;<asp:Button ID="showbutton" runat="server" Text="Показать все" OnClick="ShowButton_Click" />
            </div>
        </center>
    </div>
</asp:Content>
