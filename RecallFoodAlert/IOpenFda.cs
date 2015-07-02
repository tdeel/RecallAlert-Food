using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EccoSelect.com
{
  /// <summary>
  /// The IOpenFda interface defines the contract for interfacing
  /// with the OpenFDA API.
  /// See https://open.fda.gov for more information about OpenFDA
  /// </summary>
  interface IOpenFda
  {
    List<RecallFoodAlertData> callAPI(string searchText, string state);
  }
}
