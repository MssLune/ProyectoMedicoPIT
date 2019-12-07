using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;
using Microsoft.AspNet.Identity;

namespace MvcAuth.Controllers
{
    public class CheckOutController : Controller
    {
        Ecomerce2019Entities db = new Ecomerce2019Entities();
        // GET: CheckOut
        public ActionResult Index()
        {
            ViewBag.PayMethod = new SelectList(db.tb_TipoPago, "idTipoPago", "nomTipoPago");
            ViewBag.distrito = new SelectList(db.tb_Distrito, "idDistrito", "nomDistrito");


            var data = this.GetDefaultData();

            return View(data);
        }


        //PLACE ORDER--LAST STEP
        public ActionResult PlaceOrder(FormCollection getCheckoutDetails)
        {
            TempShopData.UsrID = User.Identity.GetUserId();
            int shpID = 1;
            if (db.tb_DetalleEnvio.Count() > 0)
            {
                shpID = db.tb_DetalleEnvio.Max(x => x.idDetalleEnvio) + 1;
            }
            int payID = 1;
            if (db.tb_Pago.Count() > 0)
            {
                payID = db.tb_Pago.Max(x => x.idPago) + 1;
            }
            int orderID = 1;
            if (db.tb_OrdenExt.Count() > 0)
            {
                orderID = db.tb_OrdenExt.Max(x => x.idOrden) + 1;
            }


            tb_DetalleEnvio shpDetails = new tb_DetalleEnvio();
            shpDetails.idDetalleEnvio = shpID;
            shpDetails.nombre = getCheckoutDetails["FirstName"];
            shpDetails.apellido = getCheckoutDetails["LastName"];
            shpDetails.correo = getCheckoutDetails["Email"];
            shpDetails.telefono = getCheckoutDetails["Mobile"];
            shpDetails.direccion = getCheckoutDetails["Address"];
            shpDetails.idDistrito = Int32.Parse(getCheckoutDetails["distrito"]);
            db.tb_DetalleEnvio.Add(shpDetails);
            db.SaveChanges();

            tb_Pago pay = new tb_Pago();
            pay.idPago = payID;
            pay.idTipoPago = Convert.ToInt32(getCheckoutDetails["PayMethod"]);
            db.tb_Pago.Add(pay);
            db.SaveChanges();


            tb_OrdenExt o = new tb_OrdenExt();
            o.idOrden = orderID;
            o.idCliente = TempShopData.UsrID;
            o.idPago = payID;
            o.idDetalleEnvio = shpID;
            //o.descuento = Convert.ToInt32(getCheckoutDetails["discount"]);
            //o.cantidadTotal = Convert.ToInt32(getCheckoutDetails["totalAmount"]);
            o.Completo = true;
            o.fechaOrden = DateTime.Now;
            db.tb_OrdenExt.Add(o);
            db.SaveChanges();

            foreach (var OD in TempShopData.items)
            {
                OD.idOrden = orderID;
                OD.tb_OrdenExt = db.tb_OrdenExt.Find(orderID);
                OD.tb_Doctor = db.tb_Doctor.Find(OD.idDoctor);
                OD.fechaOrden = DateTime.Now;
                db.tb_detalleOrden.Add(OD);
                db.SaveChanges();
            }


            return RedirectToAction("Index", "ThankYou");

        }
       

    }

}