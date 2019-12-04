using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProyectoFinal2._0;

namespace ProyectoFinal2._0.Controllers
{
    public class SalidasController : Controller
    {
        private ProyectoFinalEntities db = new ProyectoFinalEntities();

        // GET: Salidas
        public ActionResult Index()
        {
            var salidas = db.Salidas.Include(s => s.Empleados).Include(s => s.Tipo_salida1);
            return View(salidas.ToList());
        }

        // GET: Salidas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Salidas salidas = db.Salidas.Find(id);
            if (salidas == null)
            {
                return HttpNotFound();
            }
            return View(salidas);
        }

        // GET: Salidas/Create
        public ActionResult Create()
        {
            ViewBag.emp_id = new SelectList(db.Empleados, "empleadoId", "emp_codigo");
            ViewBag.tipo_salida = new SelectList(db.Tipo_salida, "tipo_salida_id", "descripcion");
            return View();
        }

        // POST: Salidas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "salidaId,emp_id,tipo_salida,motivo,fecha_salida")] Salidas salidas, Empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Salidas.Add(salidas);
                var res = db.Database.SqlQuery<Int32>("Usp_Update_Empleado @emp_id",
                    new SqlParameter("@emp_id", salidas.emp_id)).SingleOrDefault();
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.emp_id = new SelectList(db.Empleados, "empleadoId", "emp_codigo", salidas.emp_id);
            ViewBag.tipo_salida = new SelectList(db.Tipo_salida, "tipo_salida_id", "descripcion", salidas.tipo_salida);
            return View(salidas);
        }

        // GET: Salidas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Salidas salidas = db.Salidas.Find(id);
            if (salidas == null)
            {
                return HttpNotFound();
            }
            ViewBag.emp_id = new SelectList(db.Empleados, "empleadoId", "emp_codigo", salidas.emp_id);
            ViewBag.tipo_salida = new SelectList(db.Tipo_salida, "tipo_salida_id", "descripcion", salidas.tipo_salida);
            return View(salidas);
        }

        // POST: Salidas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "salidaId,emp_id,tipo_salida,motivo,fecha_salida")] Salidas salidas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(salidas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.emp_id = new SelectList(db.Empleados, "empleadoId", "emp_codigo", salidas.emp_id);
            ViewBag.tipo_salida = new SelectList(db.Tipo_salida, "tipo_salida_id", "descripcion", salidas.tipo_salida);
            return View(salidas);
        }

        // GET: Salidas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Salidas salidas = db.Salidas.Find(id);
            if (salidas == null)
            {
                return HttpNotFound();
            }
            return View(salidas);
        }

        // POST: Salidas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Salidas salidas = db.Salidas.Find(id);
            db.Salidas.Remove(salidas);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
