//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoFinal2._0
{
    using System;
    using System.Collections.Generic;
    
    public partial class Nominas
    {
        public int nominaId { get; set; }
        public Nullable<int> año { get; set; }
        public Nullable<int> mes { get; set; }
        public Nullable<long> monto_total { get; set; }
    
        public virtual Mes Mes1 { get; set; }
    }
}
