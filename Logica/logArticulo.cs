using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using Entidades;

namespace Logica
{
   public class logArticulo
    {
        perArticulo persistencia = new perArticulo();

        public Articulo Buscar(string CodigoArt)
    {
        return persistencia.BuscarArticulo(CodigoArt);
    }

        public void Agregar(Articulo articulo)
        {
            int valor = persistencia.AgregarArticulo(articulo);
            if (valor != 1)
                throw new Exception("No se pudo agregar el articulo");
 
        }

        public List<Articulo> Listar()
        {
            List<Articulo> articulos = new List<Articulo>();

            articulos.AddRange(persistencia.ListarArticulos());

            return articulos;
        }

        public List<Articulo> ListarEnUso()
        {
            return persistencia.ListarArticulosUsados();
        }
    }
}
