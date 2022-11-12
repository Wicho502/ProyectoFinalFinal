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
    public class DetalleGestionController : ControllerBase
    {
        private readonly ConexionSQLServer context;

        public DetalleGestionController(ConexionSQLServer context)
        {
            this.context = context;
        }

        [HttpPost]
        [Route("store")]
        public IActionResult store(JObject request)
        {
            try
            {
                float porcentaje = Int32.Parse(request.GetValue("porcentaje").ToString());
                int idActividad = Int32.Parse(request.GetValue("idActividad").ToString());
                string FechaInicio = request.GetValue("Fechainicio").ToString();
                string FechaFin = request.GetValue("fechafin").ToString();
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudDetalleGestion";
                comando.Parameters.AddWithValue("@porcentaje", porcentaje);
                comando.Parameters.AddWithValue("@idActividad", idActividad);
                comando.Parameters.AddWithValue("@fechainicio", FechaInicio);
                comando.Parameters.AddWithValue("@fechafin", FechaFin);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 1);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Detalle de Gestion Agregada con Exito";
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
                float porcentaje = Int32.Parse(request.GetValue("porcentaje").ToString());
                int idActividad = Int32.Parse(request.GetValue("idActividad").ToString());
                string FechaInicio = request.GetValue("Fechainicio").ToString();
                string FechaFin = request.GetValue("fechafin").ToString();
                int estado = Int32.Parse(request.GetValue("estado").ToString());

                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudDetalleGestion";
                comando.Parameters.AddWithValue("@porcentaje", porcentaje);
                comando.Parameters.AddWithValue("@idActividad", idActividad);
                comando.Parameters.AddWithValue("@fechainicio", FechaInicio);
                comando.Parameters.AddWithValue("@fechafin", FechaFin);
                comando.Parameters.AddWithValue("@estado", estado);
                comando.Parameters.AddWithValue("@opcion", 2);
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                DataSet setter = new DataSet();
                adapter.Fill(setter, "tabla");
                dynamic resultado = new JObject();
                resultado.response = 1;
                resultado.message = "Detalle de Gestion Modificada con Exito";
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
                comando.CommandText = "crudDetalleGestion";
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
                List<DetalleGestion> list = new List<DetalleGestion>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudDetalleGestion";
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 4;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    DetalleGestion degs = new DetalleGestion();
                    degs.id = (int)reader["id"];
                    degs.porcentaje = (double)reader["porcentaje"];
                    degs.fechainicio = reader["fechaInicio"].ToString();
                    degs.fechafin = reader["fechaFin"].ToString();
                    degs.estado = (int)reader["estado"];
                    list.Add(degs);
                }
                conexion.Close();
                return Ok(list);
            }
            catch
            {
                return BadRequest("Error.");
            }
        }

        //Consulta ID

        [HttpGet]
        [Route("one/{id}")]
        public IActionResult One(int id)
        {
            try
            {
                List<DetalleGestion> list = new List<DetalleGestion>();
                SqlConnection conexion = (SqlConnection)context.Database.GetDbConnection();
                SqlCommand comando = conexion.CreateCommand();
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "crudDetalleGestion";
                comando.Parameters.Add("@id", SqlDbType.Int).Value = id;
                comando.Parameters.Add("@opcion", SqlDbType.Int).Value = 5;
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    DetalleGestion degs = new DetalleGestion();
                    degs.id = (int)reader["id"];
                    degs.porcentaje = (double)reader["porcentaje"];
                    degs.fechainicio = reader["fechaInicio"].ToString();
                    degs.fechafin = reader["fechaFin"].ToString();
                    degs.estado = (int)reader["estado"];
                    list.Add(degs);
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

