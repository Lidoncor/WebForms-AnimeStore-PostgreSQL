<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="ISkp.AdminOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <p></p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" class="w-auto table table-dark table-hover">
                <Columns>
                    <asp:TemplateField HeaderText="Id заказа" >
                        <ItemTemplate>
                            <asp:Label ID="idlbl" runat="server" Text='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Дата заказа">
                        <ItemTemplate>
                            <asp:Label ID="Date" runat="server" Text='<%# Eval("date") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Сумма">
                        <ItemTemplate>
                            <asp:Label ID="pricelbl" runat="server" Text='<%# Eval("price") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Id пользователя" >
                        <ItemTemplate>
                            <asp:Label ID="user_idlbl" runat="server" Text='<%# Eval("user_id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Детальнее" ID="detailsBtn" OnClick="detailsBtn_Click" runat="server" CommandArgument='<%# Eval("id") %>' />
                            <asp:Button Text="Удалить" ID="deleteBtn" OnClick="deleteorderBtn_Click" runat="server" CommandArgument='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="text-white">
                <br />
                Найти по: 
                <asp:DropDownList ID="valueList" runat="server">
                    <asp:ListItem Value="id"> Id заказа </asp:ListItem>
                    <asp:ListItem Value="price"> Сумма </asp:ListItem>
                    <asp:ListItem Value="user_id"> Id пользователя </asp:ListItem>
                </asp:DropDownList>
                &nbsp;=&nbsp;
                <asp:TextBox ID="valueText" runat="server" Columns="7"></asp:TextBox>
                &nbsp;<asp:Button ID="findbutton" runat="server" Text="Найти" OnClick="FindButton_Click" />
                &nbsp;<asp:Button ID="showbutton" runat="server" Text="Показать все записи" OnClick="ShowButton_Click" />
                <br /><br />
            </div>
        </center>
    </div>
</asp:Content>
