using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProyectoFinal2._0;

namespace ProyectoFinal2._0.Controllers
{
    public class EmpleadosController : Controller
    {
        private ProyectoFinalEntities db = new ProyectoFinalEntities();

        // GET: Empleados
        public ActionResult Index()
        {
            var empleados = db.Empleados.Include(e => e.Cargo).Include(e => e.Departamentos).Include(e => e.Mes);
            return View(empleados.ToList());
        }

        // GET: Empleados/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleados empleados = db.Empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            return View(empleados);
        }

        // GET: Empleados/Create
        public ActionResult Create()
        {
            ViewBag.cargoId = new SelectList(db.Cargo, "cargoId", "cargo1");
            ViewBag.departamentoId = new SelectList(db.Departamentos, "departamentoId", "nombre");
            ViewBag.mes_ingreso = new SelectList(db.Mes, "mesId", "mes1");
            return View();
        }

        // POST: Empleados/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "empleadoId,departamentoId,cargoId,mes_ingreso,año_ingreso,emp_codigo,nombre,apellido,telefono,salario,estatus")] Empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Empleados.Add(empleados);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cargoId = new SelectList(db.Cargo, "cargoId", "cargo1", empleados.cargoId);
            ViewBag.departamentoId = new SelectList(db.Departamentos, "departamentoId", "nombre", empleados.departamentoId);
            ViewBag.mes_ingreso = new SelectList(db.Mes, "mesId", "mes1", empleados.mes_ingreso);
            return View(empleados);
        }

        // GET: Empleados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleados empleados = db.Empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            ViewBag.cargoId = new SelectList(db.Cargo, "cargoId", "cargo1", empleados.cargoId);
            ViewBag.departamentoId = new SelectList(db.Departamentos, "departamentoId", "nombre", empleados.departamentoId);
            ViewBag.mes_ingreso = new SelectList(db.Mes, "mesId", "mes1", empleados.mes_ingreso);
            return View(empleados);
        }

        // POST: Empleados/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "empleadoId,departamentoId,cargoId,mes_ingreso,año_ingreso,emp_codigo,nombre,apellido,telefono,salario,estatus")] Empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleados).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cargoId = new SelectList(db.Cargo, "cargoId", "cargo1", empleados.cargoId);
            ViewBag.departamentoId = new SelectList(db.Departamentos, "departamentoId", "nombre", empleados.departamentoId);
            ViewBag.mes_ingreso = new SelectList(db.Mes, "mesId", "mes1", empleados.mes_ingreso);
            return View(empleados);
        }

        // GET: Empleados/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleados empleados = db.Empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            return View(empleados);
        }

        // POST: Empleados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Empleados empleados = db.Empleados.Find(id);
            db.Empleados.Remove(empleados);
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
