using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class AvisoComun : Aviso
    {
        private List<string> palabrasClaves = new List<string>();

        public List<string> PalabrasClaves
        {
            get { return palabrasClaves; }
            set
            {
                if (value != null)
                {
                    palabrasClaves = value;
                                    }
                else
                {
                    throw new Exception("\n* Debe de ingresar las palabra clave *");

                }
            }
        }

         public AvisoComun(int pIdAviso, List<string> pTelefono, DateTime pPublicacion, Categoria pCategoria, List<string> pPalabrasClaves)
            : base(pIdAviso, pTelefono, pPublicacion, pCategoria)
        {
            PalabrasClaves = pPalabrasClaves;
        }
    }
}
