using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Entidades;


namespace FronEnd
{
    public partial class ListarAvisoXArticulo : System.Web.UI.Page
    {
        private void ListarArticulos()
        {
            try 
            {
                logArticulo logica = new logArticulo();
                ddlArticulos.DataSource = logica.ListarEnUso();
                //ddlArticulos.DataTextField = " CodigoArt";
                ddlArticulos.DataValueField = "CodigoArt";
                ddlArticulos.DataBind();
 
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
 
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarArticulos();
            }
        }

        protected void ddlArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                logAviso logaviso = new logAviso();

                AvisoDestacado aviso = logaviso.BuscarDestacadoPorArticulo(ddlArticulos.SelectedValue.ToString());
                List<string> telefonos = logaviso.Listartelefonos(aviso.IdAviso);

                lblidaviso.Text = aviso.IdAviso.ToString();
                lblFecha.Text = aviso.FechaPublicacion.ToString();
                lblCat.Text = aviso.Categoria.Nombre.ToString();
                lbTelefonos.DataSource = telefonos;
                lbTelefonos.DataBind();

            }
            catch (Exception ex)
            { lblError.Text = ex.Message; }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            try
            {
                lbTelefonos.Items.Clear();
                lblCat.Text = string.Empty;
                lblFecha.Text = string.Empty;
                lblidaviso.Text = string.Empty;
            }
            catch (Exception ex) { lblError.Text = ex.Message; }
        }
    }
}