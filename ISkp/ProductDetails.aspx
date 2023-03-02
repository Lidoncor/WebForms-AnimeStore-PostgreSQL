<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ISkp.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="DetailsListView" runat="server">
        <ItemTemplate>
            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6">
                            <img class="card-img-top mb-5 mb-md-0" src="assets/img/<%#Eval("picture") %>.jpg" alt="" />
                        </div>
                        <div class="col-md-6">
                            <h1 class="display-5 fw-bolder text-white"><%#Eval("name") %></h1>
                            <div class="fs-5 mb-5 text-white">
                                <span><%#Eval("price") %>₽</span>
                            </div>
                            <p class="lead text-white"><%#Eval("info") %></p>
                            <div class="d-flex">
                                <asp:LinkButton ID="AddToCartButton" runat="server" class="btn btn-outline-light mt-auto" OnCommand="AddToCart_Click" CommandArgument='<%#Eval("id") %>'>Добавить в корзину</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
