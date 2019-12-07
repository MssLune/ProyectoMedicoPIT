using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAuth.Models;

namespace MvcAuth.Controllers
{
    public class AdminController : Controller
    {
        Ecomerce2019Entities db = new Ecomerce2019Entities();
        // GET: Admin
        public ActionResult Index()
        {
            ViewBag.Doc = db.tb_Doctor.ToList();
            return View();
        }

        public void GetViewBagData()
        {
            ViewBag.CategoryID = new SelectList(db.tb_Categoria, "idCategoria", "nomCtegoria");

        }

        //////////////////////CLIENTE////////////////////////////

        public ActionResult ListarCliente()
        {
            return View(db.AspNetUsers.ToList());
        }

        //AUN NO SE REALIZÓ

        //Get Edit
        [HttpGet]
        public ActionResult EditarCliente(String id)
        {
            AspNetUsers product = db.AspNetUsers.Single(x => x.Id == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View("EditarCliente", product);
        }

        //Post Edit
        [HttpPost]
        public ActionResult EditarCliente(AspNetUsers prod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prod).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ListarCliente", "Admin");
            }
            GetViewBagData();
            return View(prod);
        }

        ///

        /*ELIMINAR CLIENTE*/
        public ActionResult DeleteCliente(String id)
        {
            AspNetUsers cli = db.AspNetUsers.Find(id);
            return View(cli);
        }
        [HttpPost, ActionName("DeleteCliente")]
        public ActionResult DeleteClienteConfirmed(String id)
        {
            AspNetUsers cli = db.AspNetUsers.Find(id);
            db.AspNetUsers.Remove(cli);
            db.SaveChanges();
            return RedirectToAction("ListarCliente", "Admin");
        }

       
        ////////////////////// FIN CLIENTE////////////////////////////

        //////////////////////ESPECIALIDAD////////////////////////////
        /*LISTAR ESPECIALIDADES*/
        public ActionResult listaEspecialidad()
        {
            return View(db.tb_Categoria.ToList());
        }

        [HttpGet]
        public ActionResult EditarEspecialidad(int id)
        {
            tb_Categoria product = db.tb_Categoria.Single(x => x.idCategoria == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View("EditarEspecialidad", product);
        }

        //Post Edit
        [HttpPost]
        public ActionResult EditarEspecialidad(tb_Categoria prod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prod).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("listaEspecialidad", "Admin");
            }
            GetViewBagData();
            return View(prod);
        }

        /*ELIMINAR tb_Categoria*/
        public ActionResult DeleteEspecialidad(int id)
        {
            tb_Categoria cli = db.tb_Categoria.Find(id);
            return View(cli);
        }
        [HttpPost, ActionName("DeleteEspecialidad")]
        public ActionResult DeleteEspecialidadConfirmed(int id)
        {
            tb_Categoria cli = db.tb_Categoria.Find(id);
            db.tb_Categoria.Remove(cli);
            db.SaveChanges();
            return RedirectToAction("listaEspecialidad", "Admin");
        }

        //AGREGAR ESPECIALIDAD
        public ActionResult crearEspecialidad()
        {
            
            return View(new tb_Categoria());
        }
        [HttpPost]
        public ActionResult crearEspecialidad(tb_Categoria p)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.tb_Categoria.Add(p);
                    db.SaveChanges();
                }
                else
                {
                    return View();
                }
            }
            catch (Exception e)
            {
                ViewBag.mensaje = e.Message;
            }
            
            return RedirectToAction("listaEspecialidad", "Admin");
        }

        //////////////////////FIN ESPECIALIDAD/////////////////////////
        /**/
        /*LISTAR DOCTOR*/
        //////////////////////DOCTOR/////////////////////////
        public ActionResult listaDoctores()
        {
            return View(db.tb_Doctor.ToList());
        }
        
        public ActionResult DeleteDoctor(int id)
        {
            tb_Doctor d = db.tb_Doctor.Find(id);
            return View(d);
        }
        [HttpPost, ActionName("DeleteDoctor")]
        public ActionResult DeleteDoctorConfirmed(int id)
        {
            tb_Doctor d = db.tb_Doctor.Find(id);
            db.tb_Doctor.Remove(d);
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
        
        public ActionResult detalleDoctor(int id)
        {
            return View(db.tb_Doctor.Where(d => d.idDoctor == id).FirstOrDefault());
        }

        //////////////////////FIN DOCTOR/////////////////////////

        //////////////////////ORDEN/////////////////////////
        public ActionResult listarOrden()
        {

            return View(db.tb_OrdenExt.ToList());
        }

        public ActionResult listarOrdenDetalle(int id)
        {

            return View(db.tb_detalleOrden.Where(d => d.idOrden == id).FirstOrDefault());
        }
        //////////////////////FIN ORDEN/////////////////////////


        //////////////////////ENVIO/////////////////////////
        public ActionResult listarEnvio()
        {
            return View(db.tb_DetalleEnvio.ToList());
        }

        //////////////////////FIN ENVIO/////////////////////////

   


    }
}
