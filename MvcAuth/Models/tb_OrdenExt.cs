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
    
    public partial class tb_OrdenExt
    {
        public int idOrden { get; set; }
        public string idCliente { get; set; }
        public Nullable<int> idPago { get; set; }
        public Nullable<int> idDetalleEnvio { get; set; }
        public Nullable<int> descuento { get; set; }
        public Nullable<int> impuestos { get; set; }
        public Nullable<int> cantidadTotal { get; set; }
        public Nullable<System.DateTime> fechaOrden { get; set; }
        public Nullable<System.DateTime> fechaEnvio { get; set; }
        public Nullable<bool> enviado { get; set; }
        public Nullable<bool> entregar { get; set; }
        public Nullable<System.DateTime> fechaEntrega { get; set; }
        public string notas { get; set; }
        public Nullable<bool> cancelarOrden { get; set; }
        public Nullable<bool> Completo { get; set; }
    
        public virtual AspNetUsers AspNetUsers { get; set; }
        public virtual tb_DetalleEnvio tb_DetalleEnvio { get; set; }
        public virtual tb_detalleOrden tb_detalleOrden { get; set; }
        public virtual tb_Pago tb_Pago { get; set; }
    }
}