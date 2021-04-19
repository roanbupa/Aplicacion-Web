<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarArticulo.aspx.cs" Inherits="FronEnd.AgregarArticulo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Articulo</title>
    <style type="text/css">
        .style1
        {
            width: 163px;
        }
        .style2
        {
            width: 321px;
        }
        .style4
        {
            width: 163px;
            height: 32px;
        }
        .style5
        {
            width: 321px;
            height: 32px;
        }
        .style6
        {
            width: 35px;
            height: 32px;
        }
        .style7
        {
            width: 163px;
            height: 24px;
        }
        .style8
        {
            width: 321px;
            height: 24px;
        }
        .style9
        {
            width: 35px;
            height: 24px;
        }
        .style10
        {
            height: 30px;
        }
        .style13
        {}
        .style14
        {
            text-align: center;
        }
        .style15
        {
            width: 35px;
        }
        .style16
        {
            height: 30px;
            width: 35px;
        }
        .style17
        {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center" class="style17">
    
        <em>AGREGAR ARTICULO</em></div>
    <table style="width: 98%; height: 202px;">
        <tr>
            <td class="style4">
                Codigo del Articulo:</td>
            <td class="style5">
                <asp:TextBox ID="txtCodigoArt" runat="server" Height="23px" Width="133px" 
                    MaxLength="6" BackColor="#3399FF" ForeColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" 
                    ControlToValidate="txtCodigoArt" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="validarcodigoart"></asp:RequiredFieldValidator>
            </td>
            <td class="style6">
                <asp:Button ID="btnBuscar" runat="server" Height="25px" 
                    onclick="btnBuscar_Click" Text="Buscar" Width="133px" 
                    ValidationGroup="validarcodigoart" />
            </td>
        </tr>
        <tr>
            <td class="style7">
                Precio:</td>
            <td class="style8">
                <asp:TextBox ID="txtPrecio" runat="server" Width="131px" Height="22px" 
                    Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" 
                    ControlToValidate="txtPrecio" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="validaragregar"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cpvPrecio" runat="server" 
                    ControlToValidate="txtPrecio" ErrorMessage="Precio debe ser mayor a 0" 
                    ForeColor="Red" Type="Integer" ValidationGroup="validaragregar" 
                    ValueToCompare="0"></asp:CompareValidator>
            </td>
            <td class="style9">
                </td>
        </tr>
        <tr>
            <td class="style1">
                Descripcion:</td>
            <td class="style2">
                <asp:TextBox ID="txtDescripcion" runat="server" Height="49px" Width="240px" 
                    Enabled="False" CssClass="style13"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" 
                    ControlToValidate="txtDescripcion" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="validaragregar"></asp:RequiredFieldValidator>
            </td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" colspan="2">
                <asp:Label ID="lblmensaje" runat="server"></asp:Label>
            </td>
            <td class="style16">
                <asp:Button ID="btnAgregar" runat="server" Height="26px" 
                    onclick="btnAgregar_Click" Text="Agregar" Width="133px" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="style14" colspan="3">
                <asp:HyperLink ID="hylVolver" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
