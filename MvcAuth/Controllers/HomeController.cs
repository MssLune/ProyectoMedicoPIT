using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;
using Microsoft.AspNet.Identity;

namespace MvcAuth.Controllers
{
    [RequireHttps]
    public class HomeController : Controller
    {
        Ecomerce2019Entities db = new Ecomerce2019Entities();
        public ActionResult Index()
        {
            TempShopData.UsrID = User.Identity.GetUserId();
            ViewBag.user = TempShopData.UsrID;
            //var UserID = User.Identity.GetUserId();
            var query = from d in db.AspNetUsers
                        where d.Id.Equals(TempShopData.UsrID)
                        select d;

      
            ViewBag.especialidad = new SelectList(db.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");
            ViewBag.distrito = new SelectList(db.tb_Distrito.ToList(), "idDistrito", "nomDistrito");
            ViewBag.Doc = db.tb_Doctor.ToList();
            ViewBag.Cliente = db.tb_ClienteEx.ToList();
            foreach (var a in query)
            {
                ViewBag.tipo = a.PasswordHash;
                
            }
           
            this.GetDefaultData();

            return View();


        }
        
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}