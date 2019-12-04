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
    public class InfomesController : Controller
    {
        private ProyectoFinalEntities db = new ProyectoFinalEntities();
        // GET: Infomes
        public ActionResult Info_nomina(int? Año, int? Mes)
        {
            var busqueda = from s in db.Nominas select s;

            if (Año != null)
            {
                busqueda = busqueda.Where(s => s.año == Año);
            }
            else if (Mes != null)
            {
                busqueda = busqueda.Where(s => s.mes == Mes);
            }

            return View(busqueda.ToList());
        }
        public ActionResult Emp_activo(String Nombre, String Departamento)
        {
            var empleados = db.Empleados.Include(e => e.Cargo).Include(e => e.Departamentos);
            var busqueda = empleados.Where(s => s.estatus == true);

            if (!String.IsNullOrEmpty(Nombre))
            {
                busqueda = busqueda.Where(s => s.nombre.Contains(Nombre));
            }
            else if (!String.IsNullOrEmpty(Departamento))
            {
                var res = db.Database.SqlQuery<Int32>("Usp_select_depar @depar",
                    new SqlParameter("@depar", Departamento)).SingleOrDefault();
                busqueda = busqueda.Where(s => s.departamentoId == res);
            }
            return View(busqueda.ToList());
        }
        public ActionResult Emp_inactivo()
        {
            var empleados = db.Empleados.Include(e => e.Cargo).Include(e => e.Departamentos);
            var busqueda = empleados.Where(s => s.estatus == false);
            return View(busqueda.ToList());

        }
        public ActionResult Departament()
        {
            return View(db.Departamentos.ToList());
        }
    }
}