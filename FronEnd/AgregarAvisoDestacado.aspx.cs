using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;

namespace FronEnd
{
    public partial class AgregarAvisoDestacado : System.Web.UI.Page
    {
        private void ListarCategorias()
        {
            try
            {
                logCategoria logica = new logCategoria();
                ddlCat.DataSource = logica.listar();
                ddlCat.DataTextField = "Nombre";
                ddlCat.DataValueField = "CodigoCat";
                ddlCat.DataBind();
            }
            catch
            {
                lblMensaje.Text = "error al listar las publicaciones";
            }

        }

        private void ListarArticulos()
        {
            try
            {
                logArticulo logica = new logArticulo();
                ddlArt.DataSource = logica.Listar();
                ddlArt.DataValueField = "CodigoArt";
                ddlArt.DataBind();
            }
            catch
            {
                lblMensaje.Text = "Error al Listar los Articulo";
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["telefonos"] = null;
                ListarCategorias();
                ListarArticulos();
            }
        }

        protected void txtTelefono_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarTel_Click(object sender, EventArgs e)
        {
             try
            {
                lblMensaje.Text = string.Empty;

                if (txtTelefono.Text == string.Empty)
                    throw new Exception("Debe ingresar un Telefono");
                if (Session["telefonos"] == null)
                {
                    Session["telefonos"] = new List<string>();
                }
                ((List<string>)Session["telefonos"]).Add(txtTelefono.Text);
                lsbTelefonos.Items.Add(txtTelefono.Text);
                txtTelefono.Text = string.Empty; 
                txtTelefono.Focus();
            }
            catch (Exception ex)
            { 
                lblMensaje.Text = ex.Message; 
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = string.Empty;

                logCategoria logCat = new logCategoria();

                Categoria cat = logCat.Buscar(ddlCat.SelectedValue.ToString());
                if (cat == null)
                {
                    throw new Exception("Seleccione una Categoria");
                }
                logArticulo logArt = new logArticulo();
                Articulo art = logArt.Buscar(ddlArt.SelectedValue.ToString());
                if (art == null)
                {
                    throw new Exception("Seleccione un Articulo");
                }

                List<string> tel = (List<string>)Session["telefonos"];

                AvisoDestacado aviso = new AvisoDestacado(0, tel, clnFecha.SelectedDate, cat, art);
                logAviso logAviso = new logAviso();
                logAviso.AgregarD(aviso);
                ListarArticulos();
                lsbTelefonos.Items.Clear();
                Session["telefonos"] = null;


                lblMensaje.Text = "Aviso Agregado idAviso:  " + aviso.IdAviso.ToString();
            }
            catch (Exception ex)
            { 
                lblMensaje.Text = "Error al ingresar Aviso" + ex.Message; 
            }
        }
    }
}