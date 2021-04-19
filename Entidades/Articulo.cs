using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Articulo
    {
        private string _codigoArt;

        public string CodigoArt
        {
            get { return _codigoArt.Trim().ToUpper(); }
            set
            {
                if (value.Length == 6)
                {
                    _codigoArt = value; 
                }
                else
                {
                    throw new Exception("\n* El codigo debe tener 6 caracteres *");  
                }
            }
        }
        private int _precio;

        public int Precio
        {
            get { return _precio; }
            set
            {
                if (value <= 0)
                {
                    throw new Exception("\n* El precio debe ser mayor a 0 *");
                }
                else
                {
                    _precio = value;
                }
            }
            }
        private string _descripcion;

        public string Descripcion
        {
            get { return _descripcion; }
            set
            {
                if (value == string.Empty)
                {

                    throw new Exception("\n* Debe poner algo en la descripcion *");
                }
                else
                {
                    _descripcion = value;
                }
            }
            }

        public Articulo(string codA, int precio, string desc)
        {
            CodigoArt = codA;
            Precio = precio;
            Descripcion = desc;
        }

        public override string ToString()
        {
            return " \n\t Codigo: " + CodigoArt + "\n\t Precio: " + "\n\t Descripcion: " + "\n";
        }




    }
}
