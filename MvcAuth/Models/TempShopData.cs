using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcAuth.Models
{
    public class TempShopData
    {
        public static int UserID { get; set; }
        public static String UsrID { get; set; }
        public static List<tb_detalleOrden> items { get; set; }
        public static int orden
        { get; set; }
    }
}