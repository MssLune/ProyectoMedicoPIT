using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;
using Microsoft.AspNet.Identity;
using System.Web.Helpers;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace MvcAuth.Controllers
{
    public class DoctorController : Controller
    {
        Ecomerce2019Entities data = new Ecomerce2019Entities();
        int cont = 0;
        // GET: Doctor
        public ActionResult Index()
        {
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");
            ViewBag.Doc = data.tb_Doctor.ToList();
            this.GetDefaultData();
            return View();
        }

        public ActionResult Detalle()
        {
            return View();
        }

        public ActionResult findEspe(string espe = null)
        {
            // ViewBag.especialidad = data.tb_Doctor.ToList();
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");

            var query = from d in data.tb_Doctor
                        join e in data.tb_Categoria on d.idCategoria equals e.idCategoria
                        where e.nomCtegoria.StartsWith(espe)
                        select d;
            return View("findEspe", query.ToList());
        }

        public ActionResult searchEspe(int espe = 0)
        {
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria", espe);
            var lst = from d in data.tb_Doctor
                      where d.idCategoria.Equals(espe)
                      select d;
            return View("findEspe", lst.ToList());
        }

        public ActionResult searchDistrito(string distrito = null)
        {
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");

            var lst = from doc in data.tb_Doctor
                      join dis in data.tb_Distrito
            on doc.idDistrito equals dis.idDistrito
                      where dis.nomDistrito.StartsWith(distrito)
                      select doc;
            return View("searchDistrito", lst.ToList());
        }


        public ActionResult findDoctorParam(string nom = null, string dis = null, string esp = null, int pre1 = 0, int pre2 = 0)
        {
            // ViewBag.especialidad = data.tb_Doctor.ToList();
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");
            ViewBag.distrito = new SelectList(data.tb_Distrito.ToList(), "idDistrito", "nomDistrito");
            var query = from d in data.tb_Doctor
                        join e in data.tb_Categoria on d.idCategoria equals e.idCategoria
                        join f in data.tb_Distrito on d.idDistrito equals f.idDistrito

                        where e.nomCtegoria.StartsWith(esp) && f.nomDistrito.StartsWith(dis) && (d.Precio > pre1 && d.Precio < pre2)
                     || d.nomDoctor.StartsWith(nom)
                      orderby d.tb_Categoria.nomCtegoria ascending
                        select d;
            return View("findDoctorParam", query.ToList());
        }


        public ActionResult searchDoctorParam(string nom = null, int dis = 0, int esp = 0, int pre1 = 0, int pre2 = 0)
        {
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria", esp);
            ViewBag.distrito = new SelectList(data.tb_Distrito.ToList(), "idDistrito", "nomDistrito", dis);
            var lst = from dc in data.tb_Doctor
                      join es in data.tb_Categoria
                      on dc.idCategoria equals es.idCategoria
                      join ds in data.tb_Distrito
                      on dc.idDistrito equals ds.idDistrito
                      where ds.idDistrito.Equals(dis) &&
                      es.idCategoria.Equals(esp) &&
                      (dc.Precio >= pre1 && dc.Precio <= pre2) || dc.nomDoctor == nom
                      orderby es.nomCtegoria ascending
                      select dc;
            return View("findDoctorParam", lst.ToList());
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


        public ActionResult DetallesDoctor(int id)
        {
            var prod = data.tb_Doctor.Find(id);
            var reviews = data.tb_VistaReciente.Where(x => x.idDoctor == id).ToList();
            ViewBag.Reviews = reviews;
            ViewBag.TotalReviews = reviews.Count();
            ViewBag.RelatedProducts = data.tb_Doctor.Where(y => y.idCategoria == prod.idCategoria).ToList();
            AddRecentViewProduct(id);

            var ratedProd = data.Review.Where(x => x.IdDoctor == id).ToList();
            int count = ratedProd.Count();
            int TotalRate = ratedProd.Sum(x => x.Rate).GetValueOrDefault();
            ViewBag.AvgRate = TotalRate > 0 ? TotalRate / count : 0;

            this.GetDefaultData();
            return View(prod);
        }


        public ActionResult WishList(int id)
        {
            //TempShopData.UsrID = User.Identity.GetUserId();
            var query = from d in data.tb_ListaDeseosExt
                        where d.idCliente.Equals(TempShopData.UsrID)
                        select d;
            var query2 = from d in data.tb_ListaDeseosExt
                        select d;
            int idx = 0;
         
          
            tb_ListaDeseosExt wl= new tb_ListaDeseosExt();
           
            foreach (var a in query)
            {
                //a.idDoctor != id
                if (a.idDoctor!=id)
                {
                    idx = 1; //aquí
                }
                else 
                {
                    idx = 0;
                    cont++;
                }
               

            }
            if (idx == 0 && cont==0)
            {
                wl = new tb_ListaDeseosExt();
                wl.idDoctor = id;
                wl.idCliente = User.Identity.GetUserId();
                data.tb_ListaDeseosExt.Add(wl);
                data.SaveChanges();
            }
            else if(idx == 1)
            {
                wl.idDoctor = id;
                wl.idCliente = User.Identity.GetUserId();
                data.tb_ListaDeseosExt.Add(wl);
                data.SaveChanges();
            }
            

            AddRecentViewProduct(id);
            ViewBag.WlItemsNo = data.tb_ListaDeseosExt.Where(x => x.idCliente == TempShopData.UsrID).ToList().Count();

            if (TempData["returnURL"].ToString() == "/")
            {
                return RedirectToAction("Index", "Home");
            }
            return Redirect(TempData["returnURL"].ToString());
        }


        public ActionResult AddToCart(int id)
        {


            int idx = 0;

            int cont = 0;
            tb_detalleOrden OD = new tb_detalleOrden();
            OD.idDoctor = id;
            int Qty = 1;
            decimal price = data.tb_Doctor.Find(id).Precio;
            OD.cantidad = 7;
            OD.precioUnidad = price;
            OD.cantidadTotal = Qty + price;
            OD.tb_Doctor = data.tb_Doctor.Find(id);

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
            if (idx == 0 && cont == 0)
            {

                TempShopData.items.Add(OD);
                ///////////////////////////////////////////////////////////

                AddRecentViewProduct(id);

                //////////////////////////////////////////////////////////
            }
            else if (idx == 1)
            {

                TempShopData.items.Add(OD);
                ///////////////////////////////////////////////////////////

                AddRecentViewProduct(id);

                //////////////////////////////////////////////////////////
            }
            return Redirect(TempData["returnURL"].ToString());

        }



        /**************************************************REGISTRO*****************************************************/
        /***************************************************INICIO******************************************************/
        public ActionResult RegisterDoctor()
        {

            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");
            ViewBag.distrito = new SelectList(data.tb_Distrito.ToList(), "idDistrito", "nomDistrito");
            ViewBag.horario = new SelectList(data.tb_Horario.ToList(), "id_Horario", "dia");

            TempShopData.UsrID = User.Identity.GetUserId();
            ViewBag.user = TempShopData.UsrID;

            var query = from d in data.tb_Doctor
                        where d.idUser.Equals(TempShopData.UsrID)
                        select d;
            foreach (var a in query)
            {
                ViewBag.usr = a.idUser;
                ViewBag.doctor = a.idDoctor;
            }



            return View(new tb_Doctor());
        }

        [HttpPost]
        public ActionResult RegisterDoctor(tb_Doctor doc)
        {
            /*HttpPostedFileBase FileBase = Request.Files[0];
            WebImage image = new WebImage(FileBase.InputStream);
            doc.ImageURL = image.GetBytes();*/
            string fileName = Path.GetFileNameWithoutExtension(doc.ImageFile.FileName);
            string extension = Path.GetExtension(doc.ImageFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            doc.ImageURL = "~/Image/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Image/"), fileName);
            doc.ImageFile.SaveAs(fileName);
            try
            {
                doc.idUser = User.Identity.GetUserId();
                doc.ImageURL = "~/Image/" + fileName;
                data.tb_Doctor.Add(doc);
                data.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            //ViewBag.Doc = data.tb_Doctor.ToList();
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria", doc.idCategoria);
            ViewBag.distrito = new SelectList(data.tb_Distrito.ToList(), "idDistrito", "nomDistrito", doc.idDistrito);
            ViewBag.horario = new SelectList(data.tb_Horario.ToList(), "id_Horario", "dia", doc.id_Horario);
            ModelState.Clear();
            return View("InformacionDoctor", doc);
        }
        /**************************************************REGISTRO*****************************************************/
        /****************************************************FIN********************************************************/

        /***************************************************DETALLE*****************************************************/
        /****************************************************INICIO*****************************************************/
        public ActionResult InformacionDoctor()
        {
            /*var query = from d in data.tb_Doctor
                        where d.idUser.Equals(TempShopData.UsrID)
                        select d;
            foreach (var a in query)
            {
                ViewBag.doctor = a.idDoctor;
            }
            var prod = data.tb_Doctor.Find(id);
            return View(prod);*/
            this.GetDefaultData();
            TempShopData.UsrID = User.Identity.GetUserId();
            var informacion = data.tb_Doctor.Where(x => x.idUser == TempShopData.UsrID).FirstOrDefault();
            return View(informacion);
        }
        /***************************************************DETALLE*****************************************************/
        /*****************************************************FIN*******************************************************/

        /************************************************EDITAR Y GUARDAR***********************************************/
        /****************************************************INICIO*****************************************************/
        public ActionResult SaveUpdate(int id)
        {
            this.GetDefaultData();
            /*TempShopData.UsrID = User.Identity.GetUserId();
            var informacion = data.tb_Doctor.Where(x => x.idUser == TempShopData.UsrID).FirstOrDefault();*/
            var cod = data.tb_Doctor.Find(id);
            ViewBag.especialidad = new SelectList(data.tb_Categoria.ToList(), "idCategoria", "nomCtegoria");
            ViewBag.distrito = new SelectList(data.tb_Distrito.ToList(), "idDistrito", "nomDistrito");
            ViewBag.horario = new SelectList(data.tb_Horario.ToList(), "id_Horario", "dia");
            return View(cod);
        }

        [HttpPost]
        public ActionResult SaveUpdate([Bind(
            Include ="idDoctor,idUser,nomDoctor,dniDoctor,cmpDoctor,emailDoctor,DescripcionLarga,porc1,porc2,porc3,porc4,DescripcionCorta,Precio,dirDoctor,telDoctor,idCategoria,idDistrito,id_Horario,caracteristica1,caracteristica2,caracteristica3,caracteristica4,caracteristica5,caracteristica7,caracteristica8")]
               tb_Doctor doc)
        {
            /* Byte[] imagenActual = null;

             HttpPostedFileBase FileBase = Request.Files[0];

             if(FileBase == null)
             {
                 imagenActual = data.tb_Doctor.SingleOrDefault(t => t.idDoctor == doc.idDoctor).ImageURL;
             }
             else
             {
                 WebImage image = new WebImage(FileBase.InputStream);

                 doc.ImageURL = image.GetBytes(); 
             }*/

            data.Entry(doc).State = System.Data.Entity.EntityState.Modified;
            data.SaveChanges();
            //return RedirectToAction("IndexDoctor");
            return RedirectToAction("InformacionDoctor");//Falta llamar su parámetro para listado de información actualizada
        }
        /************************************************EDITAR Y GUARDAR***********************************************/
        /****************************************************FIN********************************************************/

        public ActionResult listarSolicitudesDoc( )
        {
            
            return View(data.tb_OrdenExt);
        }

        /////FOTOS
        /*
        public ActionResult getImage(int id)
        {
            tb_Doctor doctor = data.tb_Doctor.Find(id);
            byte[] byteImage = doctor.ImageURL;

            MemoryStream memoryStream = new MemoryStream(byteImage);
            Image image = Image.FromStream(memoryStream);

            memoryStream = new MemoryStream();
            image.Save(memoryStream, ImageFormat.Jpeg);
            memoryStream.Position = 0;
            return File(memoryStream,"ImageURL/jpg");
        }*/



    }
}