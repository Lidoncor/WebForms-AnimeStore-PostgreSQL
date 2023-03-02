<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="ISkp.AdminProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <div class="text-white">
            <br />
            <asp:Button ID="NewRecordButton" runat="server" Text="Добавить товар" OnClick="NewRecordButton_Click" />

            &nbsp;<asp:Label ID="namelbl" runat="server" Text="Название:" Visible="False"></asp:Label>
            &nbsp;<asp:TextBox ID="NewName" runat="server" Visible="False"></asp:TextBox>

            &nbsp;<asp:Label ID="pricelbl" runat="server" Text="Цена:" Visible="False"></asp:Label>
            &nbsp;<asp:TextBox ID="Newprice" runat="server" Visible="False"></asp:TextBox>

            &nbsp;<asp:Label ID="infolbl" runat="server" Text="Описание:" Visible="False"></asp:Label>
            &nbsp;<asp:TextBox ID="NewInfo" runat="server" Visible="False"></asp:TextBox>

            &nbsp;<asp:Label ID="typelbl" runat="server" Text="Тип товара:" Visible="False"></asp:Label>
            &nbsp;<asp:DropDownList ID="ProductType" runat="server" Visible="False"></asp:DropDownList>
            
            &nbsp;<asp:Button ID="InsertButton" runat="server" Text="Добавить" Visible="False" OnClick="InsertButton_Click" />
            &nbsp;<asp:Button ID="CancelButton" runat="server" Text="Отменить" OnClick="CancelButton_Click" Visible="False" />
            <br />
            <br />
            Поиск по: 
                <asp:DropDownList ID="valueList" runat="server">
                    <asp:ListItem Value="id"> Id </asp:ListItem>
                    <asp:ListItem Value="name"> Название </asp:ListItem>
                    <asp:ListItem Value="price"> Цена </asp:ListItem>
                </asp:DropDownList>
            &nbsp;=&nbsp;
                <asp:TextBox ID="valueText" runat="server" Columns="7"></asp:TextBox>
            &nbsp;<asp:Button ID="findbutton" runat="server" Text="Найти" OnClick="FindButton_Click" />
            &nbsp;<asp:Button ID="showbutton" runat="server" Text="Показать все" OnClick="ShowAllButton_Click" />
            <br />
            <br />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" class="w-auto table table-dark table-hover" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="OnRowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="idlbl" runat="server" Text='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Название">
                        <ItemTemplate>
                            <asp:Label ID="namelbl" runat="server" Text='<%# Eval("name") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="nametext" runat="server" Text='<%# Eval("name") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Цена">
                        <ItemTemplate>
                            <asp:Label ID="pricelbl" runat="server" Text='<%# Eval("price") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="pricetext" runat="server" Text='<%# Eval("price") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Описание">
                        <ItemTemplate>
                            <asp:Label ID="infolbl" runat="server" Text='<%# Eval("info") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="infotext" runat="server" Text='<%# Eval("info") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Фото">
                        <ItemTemplate>
                            <center><img src="assets/img/<%#Eval("picture") %>.jpg" height=150 width=100 alt="" /></center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Тип товара">
                        <ItemTemplate>
                            <asp:Label ID="Typelbl" runat="server" Text='<%# Eval("type_name") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ProductTypeList" runat="server" />
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
                            <asp:FileUpload ID="FileUpload1" accept=".jpg" runat="server"  />
                            <asp:Button Text="Обновить" ID="Updatebutton" runat="server" CommandName="Update" />
                            <asp:Button Text="Отменить" ID="Cancelbutton" runat="server" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
