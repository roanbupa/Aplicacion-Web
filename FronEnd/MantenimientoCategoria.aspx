<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantenimientoCategoria.aspx.cs" Inherits="FronEnd.MantenimientoCategoria" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Categoria</title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            text-align: center;
            text-decoration: underline;
        }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            text-align: left;
        }
        .style5
        {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style2" colspan="3">
                    <em>MANTENIMIENTO DE CATEGORIA</em></td>
            </tr>
            <tr>
                <td class="style4">
                    Codigo de Categoria:</td>
                <td>
                    <asp:TextBox ID="txtCodigoCat" runat="server" MaxLength="3" BackColor="#3399FF" 
                        ForeColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" 
                        ControlToValidate="txtCodigoCat" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validarbuscar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                        Text="Buscar" ValidationGroup="validarbuscar" />
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Nombre:</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                        ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validaragregareditarvalidaragregareditar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    Precio Base:</td>
                <td>
                    <asp:TextBox ID="txtPrecioBase" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPrecioBase" runat="server" 
                        ControlToValidate="txtPrecioBase" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validaragregareditar"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cpvPrecioBase" runat="server" 
                        ControlToValidate="txtPrecioBase" 
                        ErrorMessage="El Precio Base debe ser mayor a 0" ForeColor="Red" 
                        Operator="GreaterThan" Type="Integer" ValidationGroup="validaragregareditar" 
                        ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
                        onclick="btnAgregar_Click" Enabled="False" 
                        ValidationGroup="validaragregareditar" />
                </td>
                <td>
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                        onclick="btnEliminar_Click" Enabled="False" />
                </td>
                <td>
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" 
                        onclick="btnEditar_Click" Enabled="False" 
                        ValidationGroup="validaragregareditar" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server" CssClass="style5"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="3">
                    <asp:HyperLink ID="hylVolver" runat="server" CssClass="style3" 
                        NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
