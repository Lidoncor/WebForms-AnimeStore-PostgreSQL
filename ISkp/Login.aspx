<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ISkp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="panel-heading text-center">
                    <h3 class="panel-title text-center">Вход</h3>
                    <asp:Label class="panel-title" runat="server" Visible="false" ID="LoginState"></asp:Label>
                </div>
                <div class="panel-body">
                    <fieldset>
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="UserInput" runat="server" placeholder="Имя" type="text"></asp:TextBox>
                        </div>
                        <p></p>
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="PasswordInput" runat="server" placeholder="Пароль" type="password"></asp:TextBox>
                        </div>
                        <p></p>
                        <div class="text-center">
                            <asp:Button ID="LoginButton" runat="server" class="btn btn-success" OnCommand="LoginButton_Click" Text="Войти"></asp:Button>
                        </div>
                        <p></p>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
