//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MvcAuth.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_ClienteEx
    {
        public string id { get; set; }
        public string nomCliente { get; set; }
        public string apeCliente { get; set; }
        public string dniCliente { get; set; }
        public string UserName { get; set; }
        public string PasswordHash { get; set; }
        public Nullable<int> edad { get; set; }
        public string genero { get; set; }
        public Nullable<System.DateTime> fechaNacimiento { get; set; }
        public Nullable<int> idDistrito { get; set; }
        public string Email { get; set; }
        public string telefono { get; set; }
        public string direccion { get; set; }
        public string foto { get; set; }
        public string notas { get; set; }
    
        public virtual AspNetUsers AspNetUsers { get; set; }
        public virtual tb_Distrito tb_Distrito { get; set; }
    }
}
