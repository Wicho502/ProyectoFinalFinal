using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.Contexts
{
    public class ConexionSQLServer:DbContext
    {
        public ConexionSQLServer(DbContextOptions<ConexionSQLServer> options) : base(options)
        {
        }

        public DbSet<Accion> Accion { get; set; }
        public DbSet<Actividad> Actividad { get; set; }
        DbSet<Comentario> Comentario { get; set; }
        public DbSet<DetalleActividad> DetalleActividad { get; set; }
        public DbSet<Gestion> Gestion { get; set; }
        public DbSet<Persona> Persona { get; set; }
        public DbSet<TipoPersona> TipoPersona { get; set; }
    }

}
