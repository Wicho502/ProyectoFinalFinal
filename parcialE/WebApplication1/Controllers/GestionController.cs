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
    public class GestionController : ControllerBase
    {
        private readonly ConexionSQLServer context;

        //CREACION DE CONSTRUCTOR
        public GestionController(ConexionSQLServer context)
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
                string nombre = request.GetValue("nombre").ToString();
                string Descripcion = request.GetValue("Descripcion").ToString();
                string fecha = request.GetValue("fecha").ToString();
                int IdSupervisor = Int32.Parse(request.GetValue("IdSupervisor").ToString());
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudGestion";
                comando.Parameters.AddWithValue("@Nombre", nombre);
                comando.Parameters.AddWithValue("@Descripcion", Descripcion);
                comando.Parameters.AddWithValue("@Fecha", fecha);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 1);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Gestion Agregada con Exito";
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
                string nombre = request.GetValue("nombre").ToString();
                string Descripcion = request.GetValue("Descripcion").ToString();
                string fecha = request.GetValue("fecha").ToString();
                int IdSupervisor = Int32.Parse(request.GetValue("IdSupervisor").ToString());
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudGestion";
                comando.Parameters.AddWithValue("@Nombre", nombre);
                comando.Parameters.AddWithValue("@Descripcion", Descripcion);
                comando.Parameters.AddWithValue("@Fecha", fecha);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 2);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Gestion Modificada con Exito";
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
        [Route("update1")]
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
                comando.CommandText = "crudGestio ";
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
                List<Gestion> list = new List<Gestion>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudGestion";
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 4;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    Gestion gts = new Gestion();
                    gts.Id = (int)reader["id"];
                    gts.Nombre = (string)reader["Nombre"];
                    gts.Descripcion = (string)reader["Descripcion"];
                    gts.Fecha = reader["fecha"].ToString();
                    gts.IdSupervisor = (int)reader["id"];
                    gts.Estado = (int)reader["estado"];
                    list.Add(gts);
                }
                conexion.Close();
                return Ok(list);
            }
            catch
            {
                return BadRequest("NO SE PUEDE VISUALIZAR DATOS ERROR.");
            }
        }

        //Consulta ID

        [HttpGet]
        [Route("one/{id}")]
        public IActionResult One(int id)
        {
            try
            {
                List<Gestion> list = new List<Gestion>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudGestion";
                comando.Parameters.Add("@id", SqlDbType.Int).Value = id;
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 5;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    Gestion gts = new Gestion();
                    gts.Id = (int)reader["id"];
                    gts.Nombre = (string)reader["Nombre"];
                    gts.Descripcion = (string)reader["Descripcion"];
                    gts.Fecha = reader["fecha"].ToString();
                    gts.IdSupervisor = (int)reader["id"];
                    gts.Estado = (int)reader["estado"];
                    list.Add(gts);
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

