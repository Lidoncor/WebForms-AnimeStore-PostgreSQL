<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ISkp.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <br /><br />
            <asp:Label ID="ProfileState" class="display-5 fw-bolder text-white" runat="server" Visible="True"></asp:Label>
            <br /><br />
            <asp:GridView ID="ProfileGridView" runat="server" AutoGenerateColumns="false" class="w-auto table table-dark table-hover">
                <Columns>
                    <asp:TemplateField HeaderText="№">
                        <ItemTemplate>
                            <asp:Label ID="ProductId" runat="server" Text='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Дата заказа">
                        <ItemTemplate>
                            <asp:Label ID="Date" runat="server" Text='<%# Eval("date") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Сумма">
                        <ItemTemplate>
                            <asp:Label ID="ProductPrice" runat="server" Text='<%# Eval("price") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Детальнее" ID="DetailsButton" OnClick="DetailsButton_Click" runat="server" CommandArgument='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
