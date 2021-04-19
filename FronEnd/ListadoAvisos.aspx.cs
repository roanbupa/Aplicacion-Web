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
    public partial class ListarAvisosPorTipo : System.Web.UI.Page
    {
        private void ListarTipos()
        {
            try 
            {
                ddlTipo.Items.Add("Comunes");
                ddlTipo.Items.Add("Destacados");
                ddlTipo.Items.Add("Todos");
            }
            catch (Exception ex)
            {
                lblmensaje.Text = ex.Message;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ListarTipos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                logAviso logAviso = new logAviso();
                if (ddlTipo.SelectedValue.ToString() == "Comunes")
                {
                    grdAvisos.DataSource = logAviso.ListarComun();
                    grdAvisos.DataBind();
                }
                else if (ddlTipo.SelectedValue.ToString() == "Destacados")
                {
                    grdAvisos.DataSource = logAviso.ListarDestacado();
                    grdAvisos.DataBind();
                }
                else if (ddlTipo.SelectedValue.ToString() == "Todos")
                {
                    grdAvisos.DataSource = logAviso.ListarTodos();
                    grdAvisos.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblmensaje.Text = ex.Message;
            }
        }

    }
}