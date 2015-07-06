using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoSelect.com;

namespace RecallFoodAlert
{
  public partial class Details : System.Web.UI.Page
  {
    protected RecallFoodAlertData selectedRecall;
    protected string riskLevel = "";
    protected string riskText = "";
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        if (Request["recall"] != null)
        {
          string recallNumber = (string)Request["recall"];
          List<RecallFoodAlertData> recallList = (List<RecallFoodAlertData>)Session["recallList"];
          selectedRecall = recallList.Where(t => t.RecallNumber == recallNumber).FirstOrDefault();
          if (selectedRecall != null)
          {
            switch (selectedRecall.Classification.ToUpper())
            {
              case "CLASS I":
                riskLevel = "High";
                riskText = "Dangerous or defective products that predictably could cause serious health problems or death. Examples include: food found to contain botulinum toxin, food with undeclared allergens, a label mix-up on a lifesaving drug, or a defective artificial heart valve.";
                imgRisk.Src = "img/risk-high.png";
                break;
              case "CLASS II":
                riskLevel = "Medium";
                riskText = "Products that might cause a temporary health problem, or pose only a slight threat of a serious nature. Example: a drug that is under-strength but that is not used to treat life-threatening situations.";
                imgRisk.Src = "img/risk-med.png";
                break;
              case "CLASS III":
                riskLevel = "Low";
                riskText = "Products that are unlikely to cause any adverse health reaction, but that violate FDA labeling or manufacturing laws. Examples include: a minor container defect and lack of English labeling in a retail food.";
                imgRisk.Src = "img/risk-low.png";
                break;
              default:
                riskLevel = "Unknown";
                riskText = "";
                break;
            }

          }
        }
        else
        {
          Response.Redirect("Home.aspx");
        }
      }
    }
  }
}