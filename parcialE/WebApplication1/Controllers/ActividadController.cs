using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;
using WebApplication1.Contexts;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using Microsoft.AspNetCore.Mvc.RazorPages;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActividadController : ControllerBase
    {
        private readonly ConexionSQLServer context;

        //CREACION DE CONSTRUCTOR
        public ActividadController(ConexionSQLServer context)
        {
            this.context = context;
        }

        // GET

        //Creacion

        [HttpPost]
        [Route("store")]
        public IActionResult store(JObject request)
        {
            try
            {
                string Nombre = request.GetValue("Nombre").ToString();
                string Descripcion = request.GetValue("Descripcion").ToString();
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudActividad";
                comando.Parameters.AddWithValue("@Nombre", Nombre);
                comando.Parameters.AddWithValue("@Descripcion", Descripcion);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 1);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Actividad Agregada con Exito";
                resultado.value = 1;

                conexion.Close();

                return Ok(resultado);

            }
            catch
            {
                return BadRequest("Error.");
            }
        }

        //Actualizacion

        [HttpPost]
        [Route("update")]
        public IActionResult update(JObject request)
        {
            try
            {
                int id = Int32.Parse(request.GetValue("id").ToString());
                string Nombre = request.GetValue("Nombre").ToString();
                string Descripcion = request.GetValue("Descripcion").ToString();
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudActividad";
                comando.Parameters.AddWithValue("@Nombre", Nombre);
                comando.Parameters.AddWithValue("@Descripcion", Descripcion);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 2);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Actividad Modificada con Exito";
                resultado.value = 1;

                conexion.Close();

                return Ok(resultado);

            }
            catch
            {
                return BadRequest("Error.");
            }
        }

        //Actualizacion de Estado

        [HttpPost]
        [Route("updateestado")]
        public IActionResult updateestado(JObject request)
        {
            try
            {
                int id = Int32.Parse(request.GetValue("id").ToString());
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudActividad";
                comando.Parameters.AddWithValue("@id", id);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 3);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Estado Modificada con Exito";
                resultado.value = 1;

                conexion.Close();

                return Ok(resultado);

            }
            catch
            {
                return BadRequest("Error.");
            }
        }

        //Consulta Tabla

        [HttpGet]
        [Route("all")]
        public IActionResult GetAll()
        {
            try
            {
                List<Actividad> list = new List<Actividad>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudActividad";
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 4;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    Actividad act = new Actividad();
                    act.Id = (int)reader["id"];
                    act.Nombre = (string)reader["Nombre"];
                    act.Descripcion = (string)reader["Descripcion"];
                    act.Estado = (int)reader["estado"];
                    list.Add(act);
                }
                conexion.Close();
                return Ok(list);
            }
            catch
            {
                return BadRequest("Error.");
            }
        }

        //Consulta por ID

        [HttpGet]
        [Route("one/{id}")]
        public IActionResult One(int id)
        {
            try
            {
                List<Actividad> list = new List<Actividad>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudActividad";
                comando.Parameters.Add("@id", SqlDbType.Int).Value = id;
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 5;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    Actividad act = new Actividad();
                    act.Id = (int)reader["id"];
                    act.Nombre = (string)reader["Nombre"];
                    act.Descripcion = (string)reader["Descripcion"];
                    act.Estado = (int)reader["estado"];
                    list.Add(act);
                }
                conexion.Close();
                return Ok(list);
            }
            catch
            {
                return BadRequest("Error.");
            }
        }


    }
}
