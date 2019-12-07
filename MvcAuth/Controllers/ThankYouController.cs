using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;

namespace MvcAuth.Controllers
{
    public class ThankYouController : Controller
    {
        Ecomerce2019Entities data = new Ecomerce2019Entities();
        // GET: ThankYou
        public ActionResult Index()
        {
            ViewBag.cartBox = null;
            ViewBag.Total = null;
            ViewBag.NoOfItem = null;
            TempShopData.items = null;
            return View("Index");
        }
    }
}