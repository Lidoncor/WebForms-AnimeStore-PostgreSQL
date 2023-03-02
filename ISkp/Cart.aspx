<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ISkp.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <br /><br />
            <asp:Label ID="CartState" class="display-5 fw-bolder text-white" runat="server" Text="Корзина пустая" Visible="False"></asp:Label>
            <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="false" class="w-auto table table-dark table-hover" OnRowDeleting="CartGridView_RowDeleting">
                <Columns>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="ProductId" runat="server" Text='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Фото">
                        <ItemTemplate>
                            <center><img src="assets/img/<%#Eval("picture") %>.jpg" height="150" width="100" alt="" /></center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Название">
                        <ItemTemplate>
                            <asp:Label ID="ProductName" runat="server" Text='<%# Eval("name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Цена">
                        <ItemTemplate>
                            <asp:Label ID="ProductPrice" runat="server" Text='<%# Eval("price") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Удалить" ID="DeleteButton" runat="server" CommandName="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:LinkButton ID="CheckoutButton" runat="server" class="btn btn-outline-light mt-auto" OnCommand="CheckoutButton_Click">Сделать заказ</asp:LinkButton>
        </center>
    </div>
</asp:Content>
