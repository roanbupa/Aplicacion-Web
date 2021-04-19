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
    public partial class MantenimientoCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCodigoCat.Focus();
        }

        private void LimpioFormulario()
        {
            txtCodigoCat.Text = "";
            txtNombre.Text = "";
            txtPrecioBase.Text = "";
        }

        private void DesactivarBotones()
        {
            btnAgregar.Enabled = false;
            btnEditar.Enabled = false;
            btnEliminar.Enabled = false;

            btnBuscar.Enabled = true;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;

                txtNombre.Enabled = true;
                txtPrecioBase.Enabled = true;

                if (txtCodigoCat.Text == string.Empty)
                    throw new Exception("Ingrese el codigo de categoria");

                txtNombre.Text = string.Empty;
                txtPrecioBase.Text = string.Empty;

                logCategoria logica = new logCategoria();

                Categoria cateogria = logica.Buscar(txtCodigoCat.Text);

                if (cateogria != null)
                {
                    txtNombre.Text = cateogria.Nombre;
                    txtPrecioBase.Text = cateogria.PrecioBase.ToString();
                    btnAgregar.Enabled = false;
                    btnEliminar.Enabled = true;
                    btnEditar.Enabled = true;
                    txtCodigoCat.Enabled = false;
                    btnBuscar.Enabled = false;
                    txtNombre.Focus();
                }
                else
                {
                    btnAgregar.Enabled = true;
                    btnEliminar.Enabled = false;
                    btnEditar.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;

                Categoria categoria = new Categoria(txtCodigoCat.Text, txtNombre.Text, Convert.ToInt32(txtPrecioBase.Text));

                logCategoria logica = new logCategoria();
                logica.Agregar(categoria);

                lblError.Text = "Categoria agregada";
                LimpioFormulario();
                btnAgregar.Enabled = false;
                txtNombre.Enabled = false;
                txtPrecioBase.Enabled = false;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;

                logCategoria logica = new logCategoria();

                logica.Eliminar(txtCodigoCat.Text);

                lblError.Text = "Publicacion eliminada";
                LimpioFormulario();
                btnEliminar.Enabled = false;
                btnEditar.Enabled = false;
                txtNombre.Enabled = false;
                txtPrecioBase.Enabled = false;
                btnBuscar.Enabled = true;
                txtCodigoCat.Text = string.Empty;
            }
            catch (Exception ex)
            {
                txtCodigoCat.Enabled = true;
                btnBuscar.Enabled = true;
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                txtNombre.Enabled = false;
                txtPrecioBase.Enabled = false;
                lblError.Text = ex.Message;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try 
            {
                lblError.Text = string.Empty;

                Categoria categoria = new Categoria(txtCodigoCat.Text, txtNombre.Text, Convert.ToInt32(txtPrecioBase.Text));
                logCategoria logica = new logCategoria();

                logica.Editar(categoria);
                
                lblError.Text = "Categoria modificada";
                LimpioFormulario();
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                txtCodigoCat.Enabled = true;
                txtNombre.Enabled = false;
                txtPrecioBase.Enabled = false;
                btnBuscar.Enabled = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}