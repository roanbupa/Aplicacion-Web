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
    public partial class AgregarArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCodigoArt.Focus();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                lblmensaje.Text = string.Empty;
                
                if (txtCodigoArt.Text == string.Empty || txtDescripcion.Text == string.Empty || txtPrecio.Text == string.Empty)
                    throw new Exception("No puede quedar ningun campo vacio ");

                logArticulo logica = new logArticulo();

                Articulo articulo = logica.Buscar(txtCodigoArt.Text);

                if (articulo == null)
                {
                    Articulo articuloN = new Articulo(txtCodigoArt.Text, Convert.ToInt32(txtPrecio.Text), txtDescripcion.Text);
                    logica.Agregar(articuloN);
                    lblmensaje.Text = "Articulo Agregado";
                    txtCodigoArt.Text = string.Empty;
                    txtCodigoArt.Enabled = true;
                    txtPrecio.Text = string.Empty;
                    txtPrecio.Enabled = false;
                    txtDescripcion.Text = string.Empty;
                    txtDescripcion.Enabled = false;
                    btnAgregar.Enabled = false;
                    txtCodigoArt.Focus();
                }
                else
                {
                    lblmensaje.Text = "Ariculo ya existente con los siguientes datos";
                    txtPrecio.Text = articulo.Precio.ToString();
                    txtDescripcion.Text = articulo.Descripcion;
                }
            }
            catch (Exception ex)
            {
                lblmensaje.Text = ex.Message;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                lblmensaje.Text = string.Empty;
             
                if (txtCodigoArt.Text == string.Empty)
                    throw new Exception("Ingrese el codigo del articulo");
                
                logArticulo logica = new logArticulo();

                Articulo articulo = logica.Buscar(txtCodigoArt.Text);

                if (articulo != null)
                {
                    lblmensaje.Text = "Ariculo ya existe con los siguientes datos";
                    txtPrecio.Text = articulo.Precio.ToString();
                    txtDescripcion.Text = articulo.Descripcion;
                    btnAgregar.Enabled = false;
                    txtCodigoArt.Text = string.Empty;
                }
                else
                {
                    txtCodigoArt.Enabled = false;
                    txtPrecio.Enabled = true;
                    txtDescripcion.Enabled = true;
                    txtPrecio.Text = string.Empty;
                    txtDescripcion.Text = string.Empty;
                    btnAgregar.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                lblmensaje.Text = ex.Message;
            }
        }

    }
}