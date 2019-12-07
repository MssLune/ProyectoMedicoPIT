using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;
using Microsoft.AspNet.Identity;

namespace MvcAuth.Controllers
{
    public class MyCartController : Controller
    {
        Ecomerce2019Entities db = new Ecomerce2019Entities();
        // GET: MyCart
        public ActionResult Index()
        {
            var data = this.GetDefaultData();
            return View(data);
        }

        public ActionResult Remove(int id)
        {
            TempShopData.items.RemoveAll(x => x.idDoctor == id);
            return RedirectToAction("Index", "MyCart");

        }

        [HttpPost]
        public ActionResult ProcedToCheckout(FormCollection formcoll)
        {
            var a = TempShopData.items.ToList();
            for (int i = 0; i < formcoll.Count / 2; i++)
            {

                int pID = Convert.ToInt32(formcoll["shcartID-" + i + ""]);
                var ODetails = TempShopData.items.FirstOrDefault(x => x.idDoctor == pID);


                int qty = 7;
                ODetails.cantidad = qty;
                ODetails.precioUnidad = ODetails.precioUnidad;
                ODetails.cantidadTotal = 7 + ODetails.precioUnidad;
                TempShopData.items.RemoveAll(x => x.idDoctor == pID);

                if (TempShopData.items == null)
                {
                    TempShopData.items = new List<tb_detalleOrden>();
                }
                TempShopData.items.Add(ODetails);

            }
            return RedirectToAction("Index", "CheckOut");
        }


    }
}