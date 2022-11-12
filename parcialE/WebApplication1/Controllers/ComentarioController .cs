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
    public class ComentarioController : ControllerBase
    {
        private readonly ConexionSQLServer context;

        //CREACION DE CONSTRUCTOR
        public ComentarioController(ConexionSQLServer context)
        {
            this.context = context;
        }

        // GET

        //Creacion

        [HttpPost]
        [Route("store")]
        public IActionResult Store(JObject request)
        {
            try
            {
                string comentario = request.GetValue("comentario").ToString();
                int idPersona = Int32.Parse(request.GetValue("idpersona").ToString());
                int idGestion = Int32.Parse(request.GetValue("idGestion").ToString());
                float fecha = Int32.Parse(request.GetValue("fecha").ToString());
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudComentario";
                comando.Parameters.AddWithValue("@Comentario", comentario);
                comando.Parameters.AddWithValue("@idPersona", idPersona);
                comando.Parameters.AddWithValue("@idGestion", idGestion);
                comando.Parameters.AddWithValue("@Fecha", fecha);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 1);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Comentario Agregado con Exito";
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
                string comentario = request.GetValue("comentario").ToString();
                int idPersona = Int32.Parse(request.GetValue("idpersona").ToString());
                int idGestion = Int32.Parse(request.GetValue("idGestion").ToString());
                float fecha = Int32.Parse(request.GetValue("fecha").ToString());
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudComentario";
                comando.Parameters.AddWithValue("@Comentario", comentario);
                comando.Parameters.AddWithValue("@idPersona", idPersona);
                comando.Parameters.AddWithValue("@idGestion", idGestion);
                comando.Parameters.AddWithValue("@Fecha", fecha);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 2);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Comentario Modificado con Exito";
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
                comando.CommandText = "crudComentario";
                comando.Parameters.AddWithValue("@id", id);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 3);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Estado Modificado con Exito";
                resultado.value = 1;

                conexion.Close();

                return Ok(resultado);

            }
            catch
            {
                return BadRequest("Error.");
            }
        }

        //Consultar Tabla

        [HttpGet]
        [Route("all")]
        public IActionResult GetAll()
        {
            try
            {
                List<Comentario> list = new List<Comentario>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudComentario";
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 4;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    Comentario com = new Comentario();
                    com.id = (int)reader["id"];
                    com.comentario = (string)reader["comentario"];
                    com.idPersona = (int)reader["idpersona"];
                    com.idGestion = (int)reader["idgestion"];
                    com.fecha = reader["fecha"].ToString();
                    com.estado = (int)reader["estado"];
                    list.Add(com);
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
                List<Comentario> list = new List<Comentario>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudComentario";
                comando.Parameters.Add("@id", SqlDbType.Int).Value = id;
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 5;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    Comentario com = new Comentario();
                    com.id = (int)reader["id"];
                    com.comentario = (string)reader["comentario"];
                    com.idPersona = (int)reader["idpersona"];
                    com.idGestion = (int)reader["idgestion"];
                    com.fecha = reader["fecha"].ToString();
                    com.estado = (int)reader["estado"];
                    list.Add(com);
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