using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using log4net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text.RegularExpressions;

namespace EccoSelect.com
{
  public class OpenFda : IOpenFda
  {
    // Inversion of control...
    private string OpenFdaSite;

    private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

    public OpenFda(string OpenFdaSite)
    {
      this.OpenFdaSite = OpenFdaSite;
    }

    public List<RecallFoodAlertData> callAPI(string searchText, string state)
    {
      // string returnJson = "";
      List<RecallFoodAlertData> recallList = new List<RecallFoodAlertData>();
      if (searchText.Length > 0)
      {
        string openFdaApiKey = "?api_key=ovNVdm7TO3IlzJr8ABOS6Zpdad70SNsBV3NW757e";

        // Assemble the search parameter
        string openFdaSearch = "&search=";
        string openFdaSearchParms = "";
        if (searchText.Trim().Length > 0)
        {
          openFdaSearchParms += string.Format("recalling_firm:{0}", searchText.Replace("'", ""));
        }
        if (state.Trim().Length > 0)
        {
          if (openFdaSearchParms.Length > 0)
          {
            openFdaSearchParms += "+AND+";
          }
          openFdaSearchParms += string.Format("state:{0}", state.Trim().ToUpper());
        }
        openFdaSearch += openFdaSearchParms;

        // Limit the results for the purposes of this prototype
        string openFdaLimit = "&limit=50";

        var fdaUrl = this.OpenFdaSite + openFdaApiKey + openFdaLimit + openFdaSearch;

        WebRequest wrGetUrl;
        wrGetUrl = WebRequest.Create(fdaUrl);

        Stream objStream = null;

        try
        {
          objStream = wrGetUrl.GetResponse().GetResponseStream();
        }
        catch (Exception ex)
        {
          log.Info(ex.Message);
        }
        if (objStream != null)
        {
          StreamReader objReader = new StreamReader(objStream);

          string sLine = "";
          int i = 0;

          System.Text.StringBuilder result = new System.Text.StringBuilder();
          while (sLine != null)
          {
            i++;
            sLine = objReader.ReadLine();
            if (sLine != null)
            {
              result.Append(sLine);
            }
          }

          // Parse the JSON result
          if (result.Length > 0)
          {
            JsonTextReader jtr = new JsonTextReader(new StringReader(result.ToString()));
            // var js = new JsonSerializer();
            JObject x = JObject.Parse(result.ToString());
            // JToken rslt = x["results"];
            IList<JToken> results = x["results"].Children().ToList();
            foreach (JToken t in results)
            {
              RecallFoodAlertData rfad = new RecallFoodAlertData();
              rfad.RecallNumber = "";
              rfad.RecallReason = "";
              rfad.Status = "";
              rfad.DistPattern = "";
              rfad.ProductQuantity = "";
              rfad.InitiationDate = new DateTime(1, 1, 1, 0, 0, 0);
              rfad.State = "";
              rfad.EventId = "";
              rfad.ProductType = "";
              rfad.ProductDescription = "";
              rfad.Country = "";
              rfad.City = "";
              rfad.FirmName = "";
              rfad.ReportDate = new DateTime(1, 1, 1, 0, 0, 0);
              rfad.VoluntaryMandated = "";
              rfad.Classification = "";
              rfad.CodeInfo = "";

              if (t["recall_number"] != null)
              {
                rfad.RecallNumber = t["recall_number"].ToString();
              }
              if (t["reason_for_recall"] != null)
              {
                rfad.RecallReason = t["reason_for_recall"].ToString();
              }
              if (t["status"] != null)
              {
                rfad.Status = t["status"].ToString();
              }
              if (t["distribution_pattern"] != null)
              {
                rfad.DistPattern = t["distribution_pattern"].ToString();
              }
              if (t["product_quantity"] != null)
              {
                rfad.ProductQuantity = t["product_quantity"].ToString();
              }
              if (t["recall_initiation_date"] != null)
              {
                rfad.InitiationDate = convertApiDate(t["recall_initiation_date"].ToString());
              }
              if (t["state"] != null)
              {
                rfad.State = t["state"].ToString();
              }
              if (t["event_id"] != null)
              {
                rfad.EventId = t["event_id"].ToString();
              }
              if (t["product_type"] != null)
              {
                rfad.ProductType = t["product_type"].ToString();
              }
              if (t["product_description"] != null)
              {
                rfad.ProductDescription = t["product_description"].ToString();
              }
              if (t["country"] != null)
              {
                rfad.Country = t["country"].ToString();
              }
              if (t["city"] != null)
              {
                rfad.City = t["city"].ToString();
              }
              if (t["recalling_firm"] != null)
              {
                rfad.FirmName = t["recalling_firm"].ToString();
              }
              if (t["report_date"] != null)
              {
                rfad.ReportDate = convertApiDate(t["report_date"].ToString());
              }
              if (t["voluntary_mandated"] != null)
              {
                rfad.VoluntaryMandated = t["voluntary_mandated"].ToString();
              }
              if (t["classification"] != null)
              {
                rfad.Classification = t["classification"].ToString();
              }
              if (t["code_info"] != null)
              {
                rfad.CodeInfo = t["code_info"].ToString();
              }

              recallList.Add(rfad);
            }

          }
        }
      }
      return recallList;
    }

    public DateTime convertApiDate(string apiDate)
    {
      DateTime recallInitDate = new DateTime(1, 1, 1, 0, 0, 0);
      try
      {
        int recallYear = Convert.ToInt32(apiDate.Substring(0, 4));
        int recallMonth = Convert.ToInt32(apiDate.Substring(4, 2));
        int recallDay = Convert.ToInt32(apiDate.Substring(6, 2));
        recallInitDate = new DateTime(recallYear, recallMonth, recallDay, 0, 0, 0);
      }
      catch (Exception ex)
      {
        log.Error("Invalid date " + apiDate + "returned from OpenFDA query.  Exception: " + ex.Message);
      }
      return recallInitDate;
    }
  }
}