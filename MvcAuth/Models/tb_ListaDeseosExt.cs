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
    
    public partial class tb_ListaDeseosExt
    {
        public int idListaDeseos { get; set; }
        public string idCliente { get; set; }
        public int idDoctor { get; set; }
    
        public virtual AspNetUsers AspNetUsers { get; set; }
        public virtual tb_Doctor tb_Doctor { get; set; }
    }
}
