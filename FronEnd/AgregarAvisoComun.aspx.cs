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
    public partial class AgregarAvisoComun : System.Web.UI.Page
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
                lblmensaje.Text = "Error al Listar las Categorias";
            }
 
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["telefonos"] = null;
                Session["PalabrasClaves"] = null;
                ListarCategorias();
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                lblmensaje.Text = string.Empty;

                logCategoria logCat = new logCategoria();

                Categoria cat = logCat.Buscar(ddlCat.SelectedValue.ToString());
                if (cat == null)
                {
                    throw new Exception("Seleccione una cateoria");
                }

                List<string> tel = (List<string>)Session["telefonos"];
                List<string> palabras = (List<string>)Session["PalabrasClaves"];

                AvisoComun aviso = new AvisoComun(0, tel, clnFecha.SelectedDate, cat, palabras);
                logAviso logAviso = new logAviso();
                logAviso.AgregarC(aviso);


                lblmensaje.Text = "Aviso Agregado idAviso:  " + aviso.IdAviso.ToString();
            }
            catch (Exception ex)
            { 
                lblmensaje.Text = "Error al ingresar Aviso" + ex.Message; 
            }
        }

        protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarTel_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTelefono.Text == string.Empty)
                    throw new Exception("debe ingresar telefono");
                if (Session["telefonos"] == null)//creo una variable de session que me guarde los telefonos de la list box
                {
                    Session["telefonos"] = new List<string>(); //si no existe la instancio
                }
                ((List<string>)Session["telefonos"]).Add(txtTelefono.Text); //meto el string en la variable session
                lsbTelefonos.Items.Add(txtTelefono.Text); // se agrega el contenido a la caja de texto
                txtTelefono.Text = string.Empty; // borro lo que el usuario escribio xq ya esta en el list
                txtTelefono.Focus();
            }
            catch (Exception ex)
            { lblmensaje.Text = ex.Message; }

        }

        protected void btnAgregarPalabra_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPalabras.Text == string.Empty)
                    throw new Exception("ingrese palabra clave");

                if (Session["PalabrasClaves"] == null)//creo una variable de session que me guarde las palabras claves de la list box
                {
                    Session["PalabrasClaves"] = new List<string>(); //si no existe la instancio
                }
                ((List<string>)Session["PalabrasClaves"]).Add(txtPalabras.Text);

                lsbPalabrasClaves.Items.Add(txtPalabras.Text);
                txtPalabras.Text = string.Empty;
                txtPalabras.Focus();
            }
            catch(Exception ex) 
            {
                lblmensaje.Text = ex.Message;
            }
        }

        protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void clnFecha_SelectionChanged(object sender, EventArgs e)
        {

        }

    }
}