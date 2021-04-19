using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using Entidades;

namespace Logica
{
     public class logAviso
    {
         private perAviso persistencia = new perAviso();

         public void AgregarC(AvisoComun comun)
         {
             int valor = persistencia.AgregarAvisoComun(comun);
             if (valor < 0)
                 throw new Exception("Error al ingresar Aviso Comun");

             comun.IdAviso = valor;

             foreach (string telefono in comun.Telefono)
             {
                 persistencia.AgregarTelefono(valor, telefono);
             }
             foreach (string palabra in comun.PalabrasClaves)
             {
                 persistencia.AgregarPalabrasClaves(valor, palabra);
             }
         }

         public void AgregarD(AvisoDestacado destacado)
         {
             int valor = persistencia.AgregarAvisoDestacado(destacado);
             if (valor < 0)
                 throw new Exception("Error al ingresar Aviso Destacado");

             destacado.IdAviso = valor;

             foreach (string telefono in destacado.Telefono)
             {
                 persistencia.AgregarTelefono(valor, telefono);
             }
         }

         public AvisoDestacado BuscarDestacadoPorArticulo(string codigoArt)
         {
             return persistencia.BuscarAvisoPorArticulo(codigoArt);
         }

         public List<string> Listartelefonos(int idaviso)
         {
             return persistencia.ListarTelefonos(idaviso);
         }

         public List<AvisoComun> ListarComun()
         {
             return persistencia.ListarAvisosComunes();
         }

         public List<AvisoDestacado> ListarDestacado()
         {
             return persistencia.ListarAvisosDestacados();
         }

         public List<Aviso> ListarTodos()
         {
             List<Aviso> avisos = new List<Aviso>();
             avisos.AddRange(persistencia.ListarAvisosComunes());
             avisos.AddRange(persistencia.ListarAvisosDestacados());

             return avisos;
         }

         public List<Aviso> Listar(string codigocat)
         {
             List<Aviso> avisos = new List<Aviso>();
             avisos.AddRange(persistencia.ListarComunXCat(codigocat));
             avisos.AddRange(persistencia.ListarDestacadoXCat(codigocat));

             return avisos;
         }
    }
}
