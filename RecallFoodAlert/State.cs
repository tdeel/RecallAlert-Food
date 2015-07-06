using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EccoSelect.com
{
  public class State
  {
    private string _abbreviation;
    private string _name;

    public string Abbreviation { get { return _abbreviation; } set { _abbreviation = value; } }
    public string Name { get { return _name; } set { _name = value; } }

    public State(string name, string abbrev)
    {
      _abbreviation = abbrev;
      _name = name;
    }

    public static List<State> getStateList()
    {
      List<State> stateList = new List<State>();
      stateList.Add(new State("All States", "USA"));
      stateList.Add(new State("Alabama", "AL"));
      stateList.Add(new State("Alaska", "AK"));
      stateList.Add(new State("Arizona", "AZ"));
      stateList.Add(new State("Arkansas", "AR"));
      stateList.Add(new State("California", "CA"));
      stateList.Add(new State("Colorado", "CO"));
      stateList.Add(new State("Connecticut", "CT"));
      stateList.Add(new State("Delaware", "DE"));
      stateList.Add(new State("Florida", "FL"));
      stateList.Add(new State("Georgia", "GA"));
      stateList.Add(new State("Hawaii", "HI"));
      stateList.Add(new State("Idaho", "ID"));
      stateList.Add(new State("Illinois", "IL"));
      stateList.Add(new State("Indiana", "IN"));
      stateList.Add(new State("Iowa", "IA"));
      stateList.Add(new State("Kansas", "KS"));
      stateList.Add(new State("Kentucky", "KY"));
      stateList.Add(new State("Louisiana", "LA"));
      stateList.Add(new State("Maine", "ME"));
      stateList.Add(new State("Maryland", "MD"));
      stateList.Add(new State("Massachusetts", "MA"));
      stateList.Add(new State("Michigan", "MI"));
      stateList.Add(new State("Minnesota", "MN"));
      stateList.Add(new State("Mississippi", "MS"));
      stateList.Add(new State("Missouri", "MO"));
      stateList.Add(new State("Montana", "MT"));
      stateList.Add(new State("Nebraska", "NE"));
      stateList.Add(new State("Nevada", "NV"));
      stateList.Add(new State("New Hampshire", "NH"));
      stateList.Add(new State("New Jersey", "NJ"));
      stateList.Add(new State("New Mexico", "NM"));
      stateList.Add(new State("New York", "NY"));
      stateList.Add(new State("North Carolina", "NC"));
      stateList.Add(new State("North Dakota", "ND"));
      stateList.Add(new State("Ohio", "OH"));
      stateList.Add(new State("Oklahoma", "OK"));
      stateList.Add(new State("Oregon", "OR"));
      stateList.Add(new State("Pennsylvania", "PA"));
      stateList.Add(new State("Rhode Island", "RI"));
      stateList.Add(new State("South Carolina", "SC"));
      stateList.Add(new State("South Dakota", "SD"));
      stateList.Add(new State("Tennessee", "TN"));
      stateList.Add(new State("Texas", "TX"));
      stateList.Add(new State("Utah", "UT"));
      stateList.Add(new State("Vermont", "VT"));
      stateList.Add(new State("Virginia", "VA"));
      stateList.Add(new State("Washington", "WA"));
      stateList.Add(new State("West Virginia", "WV"));
      stateList.Add(new State("Wisconsin", "WI"));
      stateList.Add(new State("Wyoming", "WY"));
      stateList.Add(new State("Washington DC", "DC"));
      //stateList.Add(new State("Puerto Rico", "PR"));
      //stateList.Add(new State("U.S. Virgin Islands", "VI"));
      //stateList.Add(new State("American Samoa", "AS"));
      //stateList.Add(new State("Guam", "GU"));
      //stateList.Add(new State("Northern Mariana Islands", "MP"));

      return stateList;
    }
  }
}
