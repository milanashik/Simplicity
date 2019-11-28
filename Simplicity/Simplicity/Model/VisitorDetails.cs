using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Simplicity.Model
{
    public class VisitorDetails
    {
        public Int16 visitorID { get; set; }
        public string ipAddress { get; set; }

        public DateTime dateTime { get; set; }
    }
}