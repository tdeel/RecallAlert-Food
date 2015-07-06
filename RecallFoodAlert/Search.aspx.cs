using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
using EccoSelect.com;

namespace RecallFoodAlert
{
  public partial class Search : System.Web.UI.Page
  {
    private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        if (Request["search"] != null)
        {
          string searchText = (string)Request["search"];

          inputSearch.Text = searchText;
          displayResults();
        }
        if (Request["state"] != null)
        {
          string state = (string)Request["state"];
          cmbState.SelectedValue = state;
        }
        else
        {
          Response.Redirect("Home.aspx");
        }
      }
    }

    private void displayResults()
    {

      if (Session["recallList"] == null)
      {
        Response.Redirect("Home.asp"); // Session Timeout
      }

      // Get the search results...
      List<RecallFoodAlertData> recallList = (List<RecallFoodAlertData>)Session["recallList"];
      recallList = recallList.OrderBy(t => t.Classification).ThenByDescending(t => t.ReportDate).ToList<RecallFoodAlertData>();
      
      // Build the table rows and display the results
      TableHeaderRow thr = new TableHeaderRow();

      System.Text.StringBuilder resultsHTML = new System.Text.StringBuilder();
      resultsDiv.InnerHtml = "No results found";
      foreach (RecallFoodAlertData rfad in recallList)
      {

        string imageUrl = "";
        switch (rfad.Classification.ToUpper())
        {
          case "CLASS I":
            imageUrl = "img/risk-high.png";
            break;
          case "CLASS II":
            imageUrl = "img/risk-med.png";
            break;
          case "CLASS III":
            imageUrl = "img/risk-low.png";
            break;
          default:
            imageUrl = "img/No-Data.png";
            break;
        }
        resultsHTML.Append("<div class='search-result-container large-12 medium-12 small-12 columns'>");
        resultsHTML.Append("<div class='search-result-box box'>");
        string hrefUrl = string.Format("Details.aspx?recall={0}", rfad.RecallNumber);
        resultsHTML.Append("<h3><a href='" + hrefUrl + "'>" + rfad.FirmName + "</a></h3>");
        resultsHTML.Append("<div class='search-result-details large-11 medium-11 small-9 columns'>");
        resultsHTML.Append("<h4>Initiation Date: " + rfad.InitiationDate.ToString("MM/dd/yyyy") + "</h4>");
        resultsHTML.Append("<p>" + rfad.ProductDescription + "</p>");
        resultsHTML.Append("</div>");
        resultsHTML.Append("<div class='no-pad-right large-1 medium-1 small-3 columns'>");
        resultsHTML.Append("<img class='risk-level right' src='" + imageUrl + "' />");
        resultsHTML.Append("</div></div></div>");

      }
      if (resultsHTML.Length > 0)
      {
        resultsDiv.InnerHtml = resultsHTML.ToString();
      }
    }

    protected void searchButton_Click(object sender, ImageClickEventArgs e)
    {
      if (inputSearch.Text.Length > 0 || cmbState.SelectedValue.Length > 0)
      {
        OpenFda openFda = new OpenFda("https://api.fda.gov/food/enforcement.json");  // Simple IoC example.
        // Perform the search on OpenFDA...
        List<RecallFoodAlertData> recallList = openFda.callAPI(inputSearch.Text, cmbState.SelectedValue);
        Session["recallList"] = recallList;
        displayResults();
      }

    }

  }
}