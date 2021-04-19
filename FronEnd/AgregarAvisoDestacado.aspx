<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarAvisoDestacado.aspx.cs" Inherits="FronEnd.AgregarAvisoDestacado" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aviso Destacado</title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {}
        .style3
        {}
        .style4
        {
            text-align: center;
        }
        .style5
        {}
        .style6
        {}
        .style7
        {
            width: 580px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1" colspan="3">
                    AGREGAR AVISO DESTACADO</td>
            </tr>
            <tr>
                <td>
                    Categoria</td>
                <td class="style7">
                    <asp:DropDownList ID="ddlCat" runat="server" CssClass="style2" Width="137px">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Articulo</td>
                <td class="style7">
                    <asp:DropDownList ID="ddlArt" runat="server" CssClass="style3" Height="16px" 
                        Width="136px">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Fecha</td>
                <td class="style7">
                    <asp:Calendar ID="clnFecha" runat="server" BackColor="White" 
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
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Telefono</td>
                <td class="style7">
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="style6" 
                        ontextchanged="txtTelefono_TextChanged" Width="187px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" 
                        ControlToValidate="txtTelefono" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validartelefono"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="btnAgregarTel" runat="server" onclick="btnAgregarTel_Click" 
                        Text="Agregar" ValidationGroup="validartelefono" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style7">
                    <asp:ListBox ID="lsbTelefonos" runat="server" CssClass="style5" Height="128px" 
                        Width="190px"></asp:ListBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnAgregar" runat="server" onclick="btnAgregar_Click" 
                        Text=" Agregar Aviso" />
                </td>
            </tr>
            <tr>
                <td class="style4" colspan="3">
                    <asp:HyperLink ID="hylVolver" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
