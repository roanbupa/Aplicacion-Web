<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarAvisoComun.aspx.cs" Inherits="FronEnd.AgregarAvisoComun" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aviso Comun</title>
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
        .style5
        {
            text-align: center;
        }
        .style6
        {
            width: 561px;
        }
        .style8
        {
            width: 184px;
            text-align: left;
        }
        .style9
        {}
        .style12
        {
            text-decoration: underline;
        }
        .style13
        {
            width: 184px;
            text-align: left;
            height: 9px;
        }
        .style14
        {
            width: 561px;
            height: 9px;
        }
        .style15
        {
            height: 9px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 549px">
    
        <table style="width: 100%; height: 463px;">
            <tr>
                <td class="style2" colspan="3">
                    <span class="style12"><em>AGREGAR AVISO COMUN</em></span><br />
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Categoria:</td>
                <td class="style6">
                    <asp:DropDownList ID="ddlCat" runat="server" Height="28px" Width="243px" 
                        onselectedindexchanged="ddlCat_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Fecha:</td>
                <td class="style6">
                    <asp:Calendar ID="clnFecha" runat="server" 
                        onselectionchanged="clnFecha_SelectionChanged" BackColor="White" 
                        BorderColor="White" BorderWidth="1px" 
                        Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" 
                        Width="350px" NextPrevFormat="FullMonth">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" 
                            VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" 
                            ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Telefonos:</td>
                <td class="style6">
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" 
                        ControlToValidate="txtTelefono" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validartelefono"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </td>
                <td>
                    <asp:Button ID="btnAgregarTel" runat="server" Text="Agregar" 
                        onclick="btnAgregarTel_Click" style="text-align: center" 
                        ValidationGroup="validartelefono" />
                    </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style6">
                    <asp:ListBox ID="lsbTelefonos" runat="server" Height="76px" Width="165px">
                    </asp:ListBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    Palabras Claves</td>
                <td class="style14">
                    <asp:TextBox ID="txtPalabras" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPalabra" runat="server" 
                        ControlToValidate="txtPalabras" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validarpalabra"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </td>
                <td class="style15">
                    <asp:Button ID="btnAgregarPalabra" runat="server" Text="Agregar" 
                        onclick="btnAgregarPalabra_Click" ValidationGroup="validarpalabra" />
                    </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style6">
                    <asp:ListBox ID="lsbPalabrasClaves" runat="server" Height="74px" Width="163px" 
                        onselectedindexchanged="ListBox2_SelectedIndexChanged">
                    </asp:ListBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblmensaje" runat="server" CssClass="style9"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnAgregar" runat="server" onclick="btnAgregar_Click" 
                        Text="Agregar Aviso" />
                </td>
            </tr>
            <tr>
                <td class="style5" colspan="3">
                    <asp:HyperLink ID="hypVolver" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
