using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Persistencia
{
    public class Conexion
    {
        public static string connectionString = "Server=DESKTOP-C8GSQO4\\SQLEXPRESS;DataBase=Periodico;Trusted_Connection=True;";
        public static SqlConnection cnn = null;

        public static void Conectar()
        {
            if (cnn == null)
                cnn = new SqlConnection(connectionString);

            if (cnn.State != System.Data.ConnectionState.Open)
                cnn.Open();
        }

        public static void Desconectar()
        {
            if (cnn != null)
            {
                if (cnn.State == System.Data.ConnectionState.Open)
                    cnn.Close();

                cnn = null;
            }
        }

    }
}
