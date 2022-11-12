namespace WebApplication1.Models
{
    public class Comentario
    {
        public int id { get; set; }
        public string comentario { get; set; }
        public int idPersona { get; set; }
        public int idGestion { get; set; }
        public string fecha { get; set; }
        public int estado { get; set; }
    }
}
