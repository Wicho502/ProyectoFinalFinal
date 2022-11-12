namespace WebApplication1.Models
{
    public class Gestion
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Fecha { get; set; }
        public int IdSupervisor { get; set; }
        public int Estado { get; set; }
    }
}
