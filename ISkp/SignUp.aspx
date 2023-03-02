<%@ Page Title="" Language="C#" MasterPageFile="~/Def.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ISkp.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="modal-dialog" style="margin-bottom: 0">
            <div class="modal-content">
                <div class="panel-heading text-center">
                    <h3 class="panel-title">Регистрация</h3>
                    <asp:Label class="panel-title" runat="server" Visible="false" ID="SignUpState"></asp:Label>
                </div>
                <div class="panel-body">
                    <fieldset>
                        <div class="form-group">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameRegistration" ErrorMessage="Введите имя!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox class="form-control" ID="NameRegistration" runat="server" placeholder="Имя" type="text"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordRegistration" ErrorMessage="Придумайте пароль!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox class="form-control" ID="PasswordRegistration" runat="server" placeholder="Пароль" type="password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordConfirm" ControlToValidate="PasswordRegistration" ErrorMessage="Пароль не совпадает" ForeColor="Red"></asp:CompareValidator>
                            <asp:TextBox class="form-control" ID="PasswordConfirm" runat="server" placeholder="Повторите пароль" type="password"></asp:TextBox>
                        </div>
                        <p></p>
                        <div class="text-center">
                            <asp:Button ID="RegistrationButton" runat="server" class="btn btn-success" OnCommand="RegistrationButton_Click" Text="Зарегистрироваться"></asp:Button>
                        </div>
                        <p></p>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
