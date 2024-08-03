using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Filters;
using System.Web.Mvc;

namespace Onebeat_HRJ.Controllers
{
    public class AuthcodeController  : ExceptionFilterAttribute
    {
        public override void OnException(HttpActionExecutedContext context)
        {
            if (context.Response == null)
                context.Response = context.Request.CreateErrorResponse(
                    HttpStatusCode.InternalServerError, context.Exception);

            context.Response.Content.Headers.Add("auth", "anita");
        }
    }
}