using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;
using Microsoft.AspNet.Identity;

namespace MvcAuth.Controllers
{
    public class ClienteController : Controller
    {
        Ecomerce2019Entities data = new Ecomerce2019Entities();
        // GET: Doctor
        public ActionResult Index()
        {
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");
            ViewBag.Doc = data.tb_ClienteEx.ToList();
            this.GetDefaultData();
            return View();
        }

        public ActionResult Detalle()
        {
            return View();
        }


        public ActionResult searchDistrito(string distrito = null)
        {
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");

            var lst = from doc in data.tb_ClienteEx
                      join dis in data.tb_Distrito
            on doc.idDistrito equals dis.idDistrito
                      where dis.nomDistrito.StartsWith(distrito)
                      select doc;
            return View("searchDistrito", lst.ToList());
        }

        //ADD RECENT VIEWS PRODUCT IN DB
        public void AddRecentViewProduct(int pid)
        {
            if (TempShopData.UserID > 0)
            {
                tb_VistaReciente Rv = new tb_VistaReciente();
                Rv.idCliente = TempShopData.UserID;
                Rv.idDoctor = pid;
                Rv.fecha = DateTime.Now;
                data.tb_VistaReciente.Add(Rv);
                data.SaveChanges();
            }
        }


        public ActionResult DetallesCliente(int id)
        {
            var prod = data.tb_ClienteEx.Find(id);
            var reviews = data.tb_VistaReciente.Where(x => x.idCliente == id).ToList();
            ViewBag.Reviews = reviews;
            ViewBag.TotalReviews = reviews.Count();
            ViewBag.RelatedProducts = data.tb_ClienteEx.Where(y => y.idDistrito == prod.idDistrito).ToList();
            AddRecentViewProduct(id);

            var ratedProd = data.Review.Where(x => x.IdCliente == id).ToList();
            int count = ratedProd.Count();
            int TotalRate = ratedProd.Sum(x => x.Rate).GetValueOrDefault();
            ViewBag.AvgRate = TotalRate > 0 ? TotalRate / count : 0;

            this.GetDefaultData();
            return View(prod);
        }
        
    }
}