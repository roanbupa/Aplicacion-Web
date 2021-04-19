using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;

namespace Persistencia
{
    public class perAviso
    {
        
        public List<string> ListarTelefonos(int idaviso)
        {
            Conexion.Conectar();
            SqlCommand cmdd = new SqlCommand("sp_ListarTelefono", Conexion.cnn);
            cmdd.CommandType = System.Data.CommandType.StoredProcedure;
            cmdd.Parameters.AddWithValue("IdAviso", idaviso);

            SqlDataReader dr = cmdd.ExecuteReader();
            List<string> listar = new List<string>();

            while (dr.Read())
            {
                string tel = dr["telefono"].ToString();
                listar.Add(tel);
            }
            dr.Close();
            Conexion.Desconectar();

            return listar;
        }

        public List<string> ListarPalabrasClaves(int idaviso)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_ListarPalabrasClaves", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("IdAviso", idaviso);

            SqlDataReader dr = cmd.ExecuteReader();
            List<string> listar = new List<string>();

            while (dr.Read())
            {
                string palabra = dr["PalabraClave"].ToString();
                listar.Add(palabra);
            }
            dr.Close();
            Conexion.Desconectar();

            return listar;
        }

        public int AgregarAvisoComun(AvisoComun avisoC)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_AgregarAvisoComun", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Fecha", avisoC.FechaPublicacion);
            cmd.Parameters.AddWithValue("CodigoCat", avisoC.Categoria.CodigoCat);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();

            int retorno = Convert.ToInt32(r.Value);
            Conexion.Desconectar();
            return retorno;
        }

        public int AgregarAvisoDestacado(AvisoDestacado avisoD)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_AgregarAvisoDestacado", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Fecha", avisoD.FechaPublicacion);
            cmd.Parameters.AddWithValue("CodigoCat", avisoD.Categoria.CodigoCat);
            cmd.Parameters.AddWithValue("CodigoArt", avisoD.Articulo.CodigoArt);
            
            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();

            int retorno = Convert.ToInt32(r.Value);
            Conexion.Desconectar();
            return retorno;
        }

        public int AgregarTelefono(int idaviso, string tel)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_AgregarTelefono", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("idAviso", idaviso);
            cmd.Parameters.AddWithValue("Telefono", tel);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();

            int retorno = Convert.ToInt32(r.Value);
            Conexion.Desconectar();
            return retorno;
        }

        public int AgregarPalabrasClaves(int idaviso, string palabra)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_AgregarPalabrasClaves", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("idAviso", idaviso);
            cmd.Parameters.AddWithValue("PalabrasClave", palabra);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();

            int retorno = Convert.ToInt32(r.Value);
            Conexion.Desconectar();
            return retorno;
 
        }

        public AvisoDestacado BuscarAvisoPorArticulo(string codigoArt)
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_BuscarAvisoDestacadoPorArticulo", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoArt", codigoArt);
            SqlDataReader dr = cmd.ExecuteReader();

            AvisoDestacado aviso = null;

            perCategoria persistenciaCat = new perCategoria();
            perArticulo persistenciaArt = new perArticulo();
            
            Articulo art = persistenciaArt.BuscarArticulo(codigoArt);
            
            while (dr.Read())
            {
                List<string> Telefonos= ListarTelefonos(Convert.ToInt32(dr["IdAviso"]));
                Categoria cat = persistenciaCat.BuscarCategoria(dr["CodigoCat"].ToString());

                aviso = new AvisoDestacado(Convert.ToInt32(dr["IdAviso"]), Telefonos, Convert.ToDateTime(dr["FechaPublicacion"]), cat, art);
            }
            dr.Close();
            cnn.Close();

            return aviso;
        }

        public List<AvisoComun> ListarAvisosComunes()
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_ListarAvisoComun", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();

            List<AvisoComun> lista = new List<AvisoComun>();
            perCategoria percat = new perCategoria();
            

            while (dr.Read())
            {
                List<string> tel = ListarTelefonos(Convert.ToInt32(dr["IdAviso"]));
                Categoria cat = percat.BuscarCategoria(dr["CodigoCat"].ToString());
                List<string>palabras = ListarPalabrasClaves(Convert.ToInt32(dr["IdAviso"]));
                AvisoComun aviso = new AvisoComun(Convert.ToInt32(dr["IdAviso"]), tel, Convert.ToDateTime(dr["FechaPublicacion"]), cat, palabras);

                lista.Add(aviso);
            }
            dr.Close();
            cnn.Close();

            return lista;
        }

        public List<AvisoDestacado> ListarAvisosDestacados()
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_ListarAvisoDestacado", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();

            List<AvisoDestacado> lista = new List<AvisoDestacado>();
            perCategoria percat = new perCategoria();
            perArticulo perart = new perArticulo();


            while (dr.Read())
            {
                List<string> tel = ListarTelefonos(Convert.ToInt32(dr["IdAviso"]));
                Categoria cat = percat.BuscarCategoria(dr["CodigoCat"].ToString());
                Articulo art = perart.BuscarArticuloPorIdAviso(Convert.ToInt32(dr["IdAviso"]));
                AvisoDestacado aviso = new AvisoDestacado(Convert.ToInt32(dr["IdAviso"]), tel, Convert.ToDateTime(dr["FechaPublicacion"]), cat, art);
                
                lista.Add(aviso);
            }
            dr.Close();
            cnn.Close();

            return lista;
        }

        public List<AvisoComun> ListarComunXCat(string codigocat)
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_ListarAvisoComunXCat", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoCat", codigocat);
            SqlDataReader dr = cmd.ExecuteReader();
            List<AvisoComun> lista = new List<AvisoComun>();
            perCategoria perCategoria = new perCategoria();

            while (dr.Read())
            {
                List<string> telefono = ListarTelefonos(Convert.ToInt32(dr["IdAviso"]));
                List<string> palabrasclaves = ListarPalabrasClaves(Convert.ToInt32(dr["IdAviso"]));
                Categoria categoria = perCategoria.BuscarCategoria(codigocat);
                AvisoComun comun = new AvisoComun(Convert.ToInt32(dr["IdAviso"]), telefono, Convert.ToDateTime(dr["FechaPublicacion"]), categoria, palabrasclaves);
                lista.Add(comun);
            }
            dr.Close();
            cnn.Close();

            return lista;
        }

        public List<AvisoDestacado> ListarDestacadoXCat(string codigocat)
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();

            SqlCommand cmd = new SqlCommand("sp_ListarAvisoDestacadoXCat", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoCat", codigocat);
            SqlDataReader dr = cmd.ExecuteReader();
            List<AvisoDestacado> lista = new List<AvisoDestacado>();
            perCategoria perCategoria = new perCategoria();
            perArticulo perArticulo = new perArticulo();

            while (dr.Read())
            {
                List<string> telefono = ListarTelefonos(Convert.ToInt32(dr["IdAviso"]));
                Categoria categoria = perCategoria.BuscarCategoria(codigocat);
                Articulo articulo = perArticulo.BuscarArticulo(codigocat);
                AvisoDestacado destacado = new AvisoDestacado(Convert.ToInt32(dr["IdAviso"]), telefono, Convert.ToDateTime(dr["FechaPublicacion"]), categoria, articulo);
                lista.Add(destacado);
            }
            dr.Close();
            cnn.Close();

            return lista;
        }
    }
}
