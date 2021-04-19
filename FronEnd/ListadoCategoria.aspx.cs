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
    public partial class ListadoCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ListarCategorias();
        }

        public void ListarCategorias()
        {
            try
            {
                logCategoria logCategoria = new logCategoria();
                grdCategorias.DataSource = logCategoria.listar();
                grdCategorias.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }

        protected void grdCategorias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                logCategoria categoria = new logCategoria();
                Categoria cat = categoria.Buscar(grdCategorias.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                logAviso avisos = new logAviso();
                grdavisos.DataSource = avisos.Listar(cat.CodigoCat);
                grdavisos.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }

        protected void grdCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
    }
}