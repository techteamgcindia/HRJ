using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;
using Onebeat_HRJ.Controllers;
using Onebeat_HRJ.Models;
using System.Net;
using System.Net.Http;
using System.Web.Http.Filters;

namespace Onebeat_HRJ
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            var cors = new EnableCorsAttribute("*", "*", "*");
            config.EnableCors(cors);


            config.Filters.Add(new AuthcodeController());
            // config.Filters.Add(new ApplicationAuthenticationHandler());
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
