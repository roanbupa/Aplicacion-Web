<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FronEnd.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Principal</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="imgLogo" runat="server" Height="131px" 
                        ImageUrl="~/Imagenes/el-periodico-logo-575x246.jpg" style="text-align: center" 
                        Width="326px" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="hypMantenimientoCategoria" runat="server" 
                        NavigateUrl="~/MantenimientoCategoria.aspx" style="text-align: center">Mantenimineto de Categoria </asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="hylAgregarArticulo" runat="server" 
                        NavigateUrl="~/AgregarArticulo.aspx">Agregar Articulo</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="hypAgregarAvisoComun" runat="server" 
                        NavigateUrl="~/AgregarAvisoComun.aspx">Agregar Aviso Comun</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="hylAgregaAvisoDestacado" runat="server" 
                        NavigateUrl="~/AgregarAvisoDestacado.aspx">Agregar Aviso Destacado</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="hylListadoCategoria" runat="server" 
                        NavigateUrl="~/ListadoCategoria.aspx">Listado de Categorias</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="hypListarDestacadoXart" runat="server" 
                        NavigateUrl="~/ListarAvisoXArticulo.aspx">Listar Aviso por Articulo</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="hylListarXTipo" runat="server" 
                        NavigateUrl="~/ListadoAvisos.aspx">Listado de Avisos</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
