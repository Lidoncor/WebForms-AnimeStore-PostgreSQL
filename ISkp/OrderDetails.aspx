<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ISkp.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <br /><br />
            <asp:GridView ID="ProfileDetailsGridView" runat="server" AutoGenerateColumns="false" class="w-auto table table-dark table-hover">
                <Columns>
                    <asp:TemplateField HeaderText="Фото">
                        <ItemTemplate>
                            <center><img src="assets/img/<%#Eval("picture") %>.jpg" height="150" width="100" alt="" /></center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Название">
                        <ItemTemplate>
                            <asp:Label ID="namelbl" runat="server" Text='<%# Eval("name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Цена">
                        <ItemTemplate>
                            <asp:Label ID="priceIDlbl" runat="server" Text='<%# Eval("price") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="BackButton" runat="server" Text="Назад" OnClick="BackButton_Click" />
        </center>
    </div>
</asp:Content>
