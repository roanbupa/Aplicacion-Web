using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
     public class AvisoDestacado : Aviso
    {
        private Articulo _articulo;

        public Articulo Articulo
        {
            get { return _articulo; }
            set { _articulo = value; }
        }

        public AvisoDestacado(int pIdAviso, List<string> pTelefono, DateTime pPublicacion, Categoria pCategoria, Articulo pArticulo)
            : base(pIdAviso, pTelefono, pPublicacion, pCategoria)
        {
            Articulo = pArticulo;
        }

 
    }
}
