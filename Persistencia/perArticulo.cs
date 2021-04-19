using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;

namespace Persistencia
{
    public class perArticulo
    {
        public Articulo BuscarArticulo(string codigoArt)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_BuscarArt", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoArt", codigoArt);
            SqlDataReader dr = cmd.ExecuteReader();

            Articulo articulo = null;

            while (dr.Read())
            {
                articulo = new Articulo(codigoArt, Convert.ToInt32(dr["Precio"]), dr["Descripcion"].ToString());
            }
            dr.Close();
            Conexion.Desconectar();

            return articulo;          
        }

        public int AgregarArticulo(Articulo articulo)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_AgregarArt", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoArt", articulo.CodigoArt);
            cmd.Parameters.AddWithValue("Precio", articulo.Precio);
            cmd.Parameters.AddWithValue("Descripcion", articulo.Descripcion);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();
            int ret = Convert.ToInt32(r.Value);
            Conexion.Desconectar();

            return ret;
        }

        public List<Articulo> ListarArticulos()
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_ListarArt", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();
            List<Articulo> lista = new List<Articulo>();

            while (dr.Read())
            {
                Articulo articulo = new Articulo(dr["codigoArt"].ToString(), Convert.ToInt32(dr["Precio"]), dr["Descripcion"].ToString());
                lista.Add(articulo);
            }

            dr.Close();
            Conexion.Desconectar();

            return lista;
        }

        public List<Articulo> ListarArticulosUsados()
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_ListarArticulosUsados", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();
            List<Articulo> lista = new List<Articulo>();

            while (dr.Read())
            {
                Articulo articulo = new Articulo(dr["codigoArt"].ToString(), Convert.ToInt32(dr["Precio"]), dr["Descripcion"].ToString());
                lista.Add(articulo);
            }

            dr.Close();
            Conexion.Desconectar();

            return lista;
        }

        public Articulo BuscarArticuloPorIdAviso(int  idaviso)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_BuscarArtPorIdAviso", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("IdAviso", idaviso);
            SqlDataReader dr = cmd.ExecuteReader();

            Articulo articulo = null;

            while (dr.Read())
            {
                articulo = new Articulo(dr["CodigoArt"].ToString(), Convert.ToInt32(dr["precio"]), dr["descripcion"].ToString());
            }
            dr.Close();
            Conexion.Desconectar();

            return articulo;
        }

    }
}
