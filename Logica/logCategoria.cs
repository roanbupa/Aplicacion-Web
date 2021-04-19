using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using Entidades;


namespace Logica
{
    public class logCategoria
    {
        perCategoria persistencia = new perCategoria();

        public Categoria Buscar(string codigoCat)
        {
            return persistencia.BuscarCategoria(codigoCat);
        }

        public void Agregar(Categoria categoria)
        {
            int valor = persistencia.AgregarCategoria(categoria);
            if (valor == 0)
                throw new Exception("Error al ingresar la categoria");

        }

        public void Eliminar(string codigoCat)
        {
            int valor = persistencia.Eliminar(codigoCat);
            if (valor == -1)
                throw new Exception("No se puede eliminar. Tiene un avso asociado");
        }

        public void Editar(Categoria categoria)
        {
            int valor = persistencia.Editar(categoria);
            if (valor == -1)
                throw new Exception("No Existe la Categoria");
            else if (valor == -2)
                throw new Exception("El precio debe ser mayor a 0");
        }

        public List<Categoria> listar()
        {
            List<Categoria> categoriass = new List<Categoria>();

            categoriass.AddRange(persistencia.listar());

            return categoriass;
        }
        

    }
}
