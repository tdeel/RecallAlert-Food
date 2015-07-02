using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EccoSelect.com
{
  public class RecallFoodAlertData
  {
    private string _recallNumber;
    private string _recallReason;
    private string _status;
    private string _distPattern;
    private string _productQuantitiy;
    private DateTime _initiationDate;
    private string _state;
    private string _eventId;
    private string _productType;
    private string _productDescription;
    private string _country;
    private string _city;
    private string _firmName;
    private DateTime _reportDate;
    private string _voluntaryMandated;
    private string _classification;
    private string _codeInfo;

    public string RecallNumber { get { return _recallNumber; } set { _recallNumber = value; } }
    public string RecallReason { get { return _recallReason; } set { _recallReason = value; } }
    public string Status { get { return _status; } set { _status = value; } }
    public string DistPattern { get { return _distPattern; } set { _distPattern = value; } }
    public string ProductQuantity { get { return _productQuantitiy; } set { _productQuantitiy = value; } }
    public DateTime InitiationDate { get { return _initiationDate; } set { _initiationDate = value; } }
    public string State { get { return _state; } set { _state = value; } }
    public string EventId { get { return _eventId; } set { _eventId = value; } }
    public string ProductType { get { return _productType; } set { _productType = value; } }
    public string ProductDescription { get { return _productDescription; } set { _productDescription = value; } }
    public string Country { get { return _country; } set { _country = value; } }
    public string City { get { return _city; } set { _city = value; } }
    public string FirmName { get { return _firmName; } set { _firmName = value; } }
    public DateTime ReportDate { get { return _reportDate; } set { _reportDate = value; } }
    public string VoluntaryMandated { get { return _voluntaryMandated; } set { _voluntaryMandated = value; } }
    public string Classification { get { return _classification; } set { _classification = value; } }
    public string CodeInfo { get { return _codeInfo; } set { _codeInfo = value; } }
  }
}
