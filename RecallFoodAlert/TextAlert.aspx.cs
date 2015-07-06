using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecallFoodAlert
{
  public partial class TextAlert : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        if (Request.UrlReferrer != null)
        {
          string referrer = Request.UrlReferrer.AbsoluteUri;
        }
        else
        {
          Response.Redirect("Home.aspx");
        }
      }
    }

    [WebMethod]
    public static string OnSubmit(string phone, string state, string alertType, string foodOrBrand)
    {
      string rc = "";

      return rc;
    }
  }
}