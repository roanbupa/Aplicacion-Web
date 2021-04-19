<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoCategoria.aspx.cs" Inherits="FronEnd.ListadoCategoria" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Listado Categoria</title>
    <style type="text/css">
        .style1
        {
            text-align: center;
            text-decoration: underline;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            height: 302px;
        }
        </style>
</head>
<body style="height: 501px">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1" colspan="2">
                    <em>LISTADO DE CATEGORIAS</em></td>
            </tr>
            <tr>
                <td class="style3">
                    <br />
                    <asp:GridView ID="grdCategorias" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                        CellPadding="4" GridLines="Horizontal" 
                        onrowcommand="grdCategorias_RowCommand" 
                        onselectedindexchanged="grdCategorias_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="CodigoCat" HeaderText="Codigo" />
                            <asp:BoundField DataField="PrecioBase" HeaderText="Precio Base" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:ButtonField ButtonType="Button" CommandName="Listar" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
                <td class="style3">
                    <asp:GridView ID="grdavisos" runat="server" AutoGenerateColumns="False" 
                        Height="168px" Width="264px" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IdAviso" HeaderText="id aviso" />
                            <asp:BoundField DataField="FechaPublicacion" 
                                HeaderText="Fecha de Publicacion" />
                        </Columns>
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:HyperLink ID="hylVolver" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
