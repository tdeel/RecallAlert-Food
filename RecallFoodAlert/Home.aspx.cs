using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoSelect.com;

namespace RecallFoodAlert
{
  public partial class Home : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void searchButton_Click(object sender, ImageClickEventArgs e)
    {
      if (inputSearch.Text.Length > 0 || cmbState.SelectedValue.Length > 0)
      {
        lblError.Visible = false;
        OpenFda openFda = new OpenFda("https://api.fda.gov/food/enforcement.json");  // Simple IoC example.

        // Perform the search on OpenFDA...
        List<RecallFoodAlertData> recallList = openFda.callAPI(inputSearch.Text, cmbState.SelectedValue);
        //if (recallList.Count == 0)
        //{
        //  lblError.Text = inputSearch.Text + " was not found";
        //  lblError.Visible = true;
        //}
        //else
        //{
          Session["recallList"] = recallList;
          Response.Redirect("Search.aspx?search=" + inputSearch.Text + "&state=" + cmbState.SelectedValue);
        //}
      }
    }
  }
}