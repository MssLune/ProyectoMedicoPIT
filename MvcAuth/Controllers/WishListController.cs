using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;
using Microsoft.AspNet.Identity;

namespace MvcAuth.Controllers
{
    public class WishListController : Controller
    {
        Ecomerce2019Entities db = new Ecomerce2019Entities();
        

        // GET: WishList
        public ActionResult Index()
        {
            this.GetDefaultData();
           TempShopData.UsrID= User.Identity.GetUserId();
            var wishlistProducts = db.tb_ListaDeseosExt.Where(x => x.idCliente == TempShopData.UsrID).ToList();
            return View(wishlistProducts);
        }

        //REMOVE ITEM FROM WISHLIST
        public ActionResult Remove(int id)
        {
            db.tb_ListaDeseosExt.Remove(db.tb_ListaDeseosExt.Find(id));
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        //ADD TO CART WISHLIST
        public ActionResult AddToCart(int id)
        {
            int idx = 0;
            
            int cont = 0;
            tb_detalleOrden OD = new tb_detalleOrden();
            int pid = db.tb_ListaDeseosExt.Find(id).idDoctor;
            OD.idDoctor = pid;
            int Qty = 7;
            decimal price = db.tb_Doctor.Find(pid).Precio;

            OD.cantidad = 7;
            OD.precioUnidad = price;
            OD.cantidadTotal = Qty + price;
            OD.tb_Doctor = db.tb_Doctor.Find(pid);

            if (TempShopData.items == null)
            {
                TempShopData.items = new List<tb_detalleOrden>();
            }

                   var query = from d in TempShopData.items
                          select d;
                   foreach (var a in query)
                    {
         
                       if (a.idDoctor != OD.idDoctor)
                        {
                               idx = 1;

                        }
                        else
                        {
                                idx = 0;
                                cont++;
                        }

                   }
                   if (idx==0 && cont==0) {
                    
                    TempShopData.items.Add(OD);
                    ///////////////////////////////////////////////////////////
                    db.tb_ListaDeseosExt.Remove(db.tb_ListaDeseosExt.Find(id));
                    db.SaveChanges();

                    //////////////////////////////////////////////////////////
                }
                else if(idx == 1)
                {
                   
                    TempShopData.items.Add(OD);
                    ///////////////////////////////////////////////////////////
                    db.tb_ListaDeseosExt.Remove(db.tb_ListaDeseosExt.Find(id));
                    db.SaveChanges();

                    //////////////////////////////////////////////////////////

                }

            
            return Redirect(TempData["returnURL"].ToString());

        }
    }
}
