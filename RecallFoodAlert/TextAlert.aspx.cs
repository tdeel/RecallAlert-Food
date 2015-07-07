using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecallFoodAlert.Model;
using log4net;

namespace RecallFoodAlert
{
  public partial class TextAlert : System.Web.UI.Page
  {
    private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
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
      try
      {
        using (RecallEntities cx = new RecallEntities())
        {
          TextAlertSignup txtSignup = new TextAlertSignup();
          txtSignup.AlertType = alertType;
          txtSignup.MobilePhone = phone;
          txtSignup.RegistrationDateTime = DateTime.Now;
          txtSignup.SearchText = foodOrBrand;
          txtSignup.StateCode = state;
          cx.TextAlertSignup.Add(txtSignup);
          cx.SaveChanges();
        }

      }
      catch (Exception ex)
      {
        string msg = ex.Message;
        if (ex.InnerException.Message != null)
        {
          msg += "\r\n" + ex.InnerException.Message;
        }
        log.Error(msg);
        rc = "Error logged";
      }
      return rc;
    }
  }
}