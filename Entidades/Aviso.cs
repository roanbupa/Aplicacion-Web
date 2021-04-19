using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public abstract class Aviso
    {
        private int idAviso;
        private List<string> telefono = new List<string>();
        private DateTime fechaPublicacion;
        private Categoria categoria;
   

        public int IdAviso
        {
            get { return idAviso; }
            set { idAviso = value; }
        }

        public List<string> Telefono
        {
            get { return telefono; }
            set  
            {
                if (value == null)
                {
                    throw new Exception("debe tener al menos un telefono");
                }
                //else if (((List<string>)value).Count == 0)
                
                //{
                  //  throw new Exception("no hay telefonos");
                //} 
                else

                telefono = value; } //Consultar como queda
        }

        public DateTime FechaPublicacion
        {
            get { return fechaPublicacion; }
            set 
            {
                if (value < DateTime.Now.Date)
                {
                    throw new Exception("La fecha debe ser mayor a la actual");
                }
              
                
                fechaPublicacion = value;
            }
        }

        public Categoria Categoria
        {
            get { return categoria; }
            set 
            {
                if (value == null)
                    throw new Exception("Se necesita una categoria para el aviso");
                else
                    categoria = value;
            }
        }

        public Aviso(int pIdAviso, List<string> pTelefono, DateTime pPublicacion, Categoria pCategoria)
        {
            IdAviso = pIdAviso;
            Telefono = pTelefono;
            FechaPublicacion = pPublicacion;
            Categoria = pCategoria;
        }

        public override string ToString()
        {
            return "\n\tNumero: " + idAviso + "\n\n Fecha: " + fechaPublicacion + "\n\tCategoria: " + categoria + "\n\tTelefonos: " + Telefono + "\n";
        }

    }
}
