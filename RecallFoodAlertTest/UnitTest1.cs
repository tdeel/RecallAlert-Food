using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace EccoSelect.com
{
  [TestClass]
  public class RecallFoodAlertTest
  {
    [TestMethod]
    public void SearchAPI()
    {
      OpenFda openFda = new OpenFda("https://api.fda.gov/food/enforcement.json");  // Simple IoC example.

      // Search by Name and State
      string searchString = "Schnuck's";
      List<RecallFoodAlertData> recallData = openFda.callAPI(searchString, "MO");
      Assert.IsTrue(recallData.Count > 0);

      // Search by Name only, make sure that whitespace is trimmed
      recallData = openFda.callAPI(searchString, "  ");
      Assert.IsTrue(recallData.Count > 0);

      // Search by State only, make sure that whitespace is trimmed
      recallData = openFda.callAPI("  ", "MO");
      Assert.IsTrue(recallData.Count > 0);
    }

    [TestMethod]
    public void ConvertApiDate()
    {
      OpenFda openFda = new OpenFda("https://api.fda.gov/food/enforcement.json");
      string testDateString = "20101225";  // API returns date in format YYYYMMDD
      DateTime testDate = openFda.convertApiDate(testDateString);
      Assert.IsTrue(testDate.Equals(new DateTime(2010, 12, 25, 0, 0, 0)));
    }

    [TestMethod]
    public void GetStateList()
    {
      List<State> stateList = State.getStateList();
      Assert.IsTrue(stateList.Count == 56);
    }
  }
}
