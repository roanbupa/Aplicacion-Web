<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoAvisoXArticulo.aspx.cs" Inherits="FronEnd.ListarAvisoXArticulo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aviso Por Articulo</title>
    <style type="text/css">
        .style1
        {
            height: 79px;
        }
        .style2
        {
            width: 287px;
        }
        .style3
        {
        }
        #form1
        {
            height: 497px;
        }
        .style4
        {
            height: 189px;
        }
        .style5
        {
            width: 287px;
            height: 189px;
        }
        .style6
        {
            width: 298px;
        }
        .style7
        {
            width: 298px;
            height: 189px;
        }
        .style8
        {
            text-decoration: underline;
        }
    </style>
</head>
<body style="height: 594px">
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table style="width: 100%; height: 462px;">
        <tr>
            <td colspan="3" style="text-align: center" class="style8">
                <em>LISTADO AVISO POR ARTICULO</em></td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                Articulo :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlArticulos" runat="server" Height="16px" 
                    onselectedindexchanged="ddlArticulos_SelectedIndexChanged" 
                    style="text-align: center" Width="348px">
                </asp:DropDownList>
            </td>
            <td class="style1">
                <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                    Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                Id Aviso:</td>
            <td class="style2">
                <asp:Label ID="lblidaviso" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Fecha de publicacion:</td>
            <td class="style2">
                <asp:Label ID="lblFecha" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Codigo de categoria:</td>
            <td class="style2">
                <asp:Label ID="lblCat" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                Telefonos:</td>
            <td class="style5">
                <asp:ListBox ID="lbTelefonos" runat="server" Height="92px" Width="153px">
                </asp:ListBox>
            </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style3" colspan="3">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:HyperLink ID="hypVolver" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
