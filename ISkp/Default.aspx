<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ISkp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center">
                <h1 class="display-4 fw-bolder" style="color: #f70202">Магазин аниме атрибутики</h1>
            </div>
        </div>
    </header>
    <section class="py-5">
        <div class="container px-4 px-lg-5">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item dropdown">
                    <a class="btn btn-outline-light mt-auto" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Ассортимент</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li>
                            <asp:LinkButton ID="ShowAllButton" class="dropdown-item" runat="server" OnCommand="ShowAll_Click">Все товары</asp:LinkButton></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <asp:ListView ID="ProductTypeListView" runat="server">
                            <ItemTemplate>
                                <td>
                                    <asp:LinkButton ID="ProductTypeButton" runat="server" class="dropdown-item" OnCommand="ProductType_Click" CommandArgument='<%#Eval("id") %>'><%#Eval("name") %></asp:LinkButton>
                                </td>
                            </ItemTemplate>
                        </asp:ListView>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="container px-4 px-lg-5 mt-5">
            <asp:ListView ID="MainListView" runat="server" GroupItemCount="4">
                <LayoutTemplate>
                    <table>
                        <tbody>
                            <asp:PlaceHolder runat="server" ID="groupPlaceholder"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </LayoutTemplate>
                <GroupTemplate>
                    <tr class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <img class="card-img-top" src="assets/img/<%#Eval("picture") %>.jpg" alt="" />
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <h5 class="fw-bolder"><%#Eval("name") %></h5>
                                        Цена : <strong><%#Eval("price") %>₽</strong>
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <asp:LinkButton ID="AddToCartButton" runat="server" class="btn btn-outline-dark mt-auto" OnCommand="AddToCart_Click" CommandArgument='<%#Eval("id") %>'>Добавить в корзину</asp:LinkButton>
                                    </div>
                                    &nbsp;
                                <div class="text-center">
                                    <a href="ProductDetails.aspx?ProductId=<%#Eval("id") %>" class="btn btn-outline-dark mt-auto">Детали</a>
                                </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </section>
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center" style="color: #f70202">Кочубей АВТ-917</p>
        </div>
    </footer>
</asp:Content>
