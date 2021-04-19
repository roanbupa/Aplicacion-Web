using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;

namespace Persistencia
{
    public class perCategoria
    {
        public Categoria BuscarCategoria(string codigoCat)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_BuscarCategoria", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoCat", codigoCat);
            SqlDataReader dr = cmd.ExecuteReader();

            Categoria categoria = null;

            while (dr.Read())
            {
                categoria = new Categoria(codigoCat, dr["Nombre"].ToString(), Convert.ToInt32(dr["PrecioBase"]));
            }
            dr.Close();
            Conexion.Desconectar();

            return categoria;
        }

        public int AgregarCategoria(Categoria categoria)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_AgregarCategoria", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoCat", categoria.CodigoCat);
            cmd.Parameters.AddWithValue("Nombre", categoria.Nombre);
            cmd.Parameters.AddWithValue("PrecioBase", categoria.PrecioBase);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();
            int ret = Convert.ToInt32(r.Value);
            Conexion.Desconectar();

            return ret;
        }

        public int Eliminar(string codigoCat)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_EliminarCat", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoCat", codigoCat);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();
            int ret = Convert.ToInt32(r.Value);
            Conexion.Desconectar();

            return ret;
        }

        public int Editar(Categoria categoria)
        {
            Conexion.Conectar();

            SqlCommand cmd = new SqlCommand("sp_EditarCat", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CodigoCat", categoria.CodigoCat);
            cmd.Parameters.AddWithValue("Nombre", categoria.Nombre);
            cmd.Parameters.AddWithValue("PrecioBase", categoria.PrecioBase);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);

            cmd.ExecuteNonQuery();
            int ret = Convert.ToInt32(r.Value);
            Conexion.Desconectar();

            return ret;
        }

        public List<Categoria> listar()
        {
           Conexion.Conectar();
           SqlCommand cmd = new SqlCommand("sp_ListarCategoria", Conexion.cnn);
           cmd.CommandType = System.Data.CommandType.StoredProcedure;

           SqlDataReader dataReader = cmd.ExecuteReader();

           List<Categoria> lista = new List<Categoria>();

           while (dataReader.Read())
           {
               Categoria cate = new Categoria(dataReader["CodigoCat"].ToString(),Convert.ToInt32(dataReader["PrecioBase"]),dataReader["Nombre"].ToString());

               lista.Add(cate);
           }
           dataReader.Close();
           Conexion.Desconectar();

           return lista;
        }
    }
}
