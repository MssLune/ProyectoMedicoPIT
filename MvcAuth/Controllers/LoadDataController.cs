using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;

namespace MvcAuth.Controllers
{
    public static class LoadDataController
    {
        static Ecomerce2019Entities db = new Ecomerce2019Entities();
        public static List<tb_detalleOrden> GetDefaultData(this ControllerBase controller)
        {
            if (TempShopData.items == null)
            {
                TempShopData.items = new List<tb_detalleOrden>();
            }
            var data = TempShopData.items.ToList();

            controller.ViewBag.cartBox = data.Count == 0 ? null : data;
            controller.ViewBag.NoOfItem = data.Count();
            int? SubTotal = Convert.ToInt32(data.Sum(x => x.cantidadTotal));
            controller.ViewBag.Total = SubTotal;

            int Discount = 0;
            controller.ViewBag.SubTotal = SubTotal;
            controller.ViewBag.Discount = Discount;
            controller.ViewBag.TotalAmount = SubTotal - Discount;

            controller.ViewBag.WlItemsNo = db.tb_ListaDeseos.Where(x => x.idCliente == TempShopData.UserID).ToList().Count();
            return data;
        }
    }
}