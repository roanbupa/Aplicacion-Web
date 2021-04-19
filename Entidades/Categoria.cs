using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Categoria
    {
        private string codigoCat;
        private string nombre;
        private int precioBase;

        public string CodigoCat
        {
            get { return codigoCat.Trim().ToUpper(); }
            set
            {
                if (value.Length == 3)
                {
                    codigoCat = value;
                }
                else
                {
                    throw new Exception("\n* El codigo debe tener 3 caracteres *");
                }
            }
        }
       
        public string Nombre
        {
            get { return nombre; }
            set
            {
                if (value == string.Empty)
                {
                    throw new Exception("\n* Debe ingresar un nombre *");
                }
                else
                {
                    nombre = value;
                }
            }
        }

        public int PrecioBase
        {
            get { return precioBase; }
            set
            {
                if (value <= 0)
                {
                    throw new Exception("\n* Debe ingresar precio correctamente *");
                }
                else
                {
                    precioBase = value;
                }
            }
        }

        public Categoria(string pCodigo, string pNombre, int pPrecioBase)
        {
            CodigoCat = pCodigo;
            Nombre = pNombre;
            PrecioBase = pPrecioBase;
        }
        public Categoria(string pCodigo , int pPrecioBase , string pNombre)
        {
            CodigoCat = pCodigo;
            Nombre = pNombre;
            PrecioBase = pPrecioBase;
        }
        public override string ToString()
        {
            return nombre;
        }
    }
}
