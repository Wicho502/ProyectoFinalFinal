namespace WebApplication1.Models
{
    public class DetalleGestion
    {
        public int id { get; set; }
        public double porcentaje { get; set; }
        public int idActividad { get; set; }
        public string fechainicio { get; set; }
        public string fechafin { get; set; }
        public int estado { get; set; } 
    }
}
