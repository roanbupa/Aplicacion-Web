<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoAvisos.aspx.cs" Inherits="FronEnd.ListarAvisosPorTipo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Avisos</title>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 301px;
        }
        .style3
        {
            width: 149px;
            height: 122px;
        }
        .style4
        {
            width: 301px;
            height: 122px;
        }
        .style5
        {
            height: 122px;
        }
        .style6
        {
            text-decoration: underline;
        }
    </style>
</head>
<body style="height: 361px">
    <form id="form1" runat="server">
    <div style="text-align: center" class="style6">
    
        <em>LISTADO DE AVISOS</em></div>
    <table style="width: 100%; height: 333px;">
        <tr>
            <td class="style1">
                Avisos por tipo</td>
            <td class="style2">
                <asp:DropDownList ID="ddlTipo" runat="server" Height="16px" Width="199px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
                    Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td class="style3">
            </td>
            <td class="style4">
                <asp:GridView ID="grdAvisos" runat="server" AutoGenerateColumns="False" 
                    style="margin-left: 0px" Width="454px" CellPadding="4" ForeColor="#333333" 
                    GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="IdAviso" HeaderText="Id Aviso" />
                        <asp:BoundField DataField="FechaPublicacion" HeaderText="Fecha Publicacion" />
                        <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
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
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                <asp:Label ID="lblmensaje" runat="server"></asp:Label>
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
