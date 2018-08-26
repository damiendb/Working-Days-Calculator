import 'WAHolidays.dart';
import 'ContractDuration.dart';

main(List<String> arguments) {

  // Establish variables that should come from User input
  String para1 = "2018-08-27";
  String para2 = "2019-02-28";
  String para3 = "7.5";

  // Create the list of Public Holiday (global variable)
  // PubHolidayList = populateHolidays();

  // Create new ContractDuration
  ContractDuration newContract = new ContractDuration();

  // Add user input values to newContract
  newContract.StartDate = DateTime.parse(para1);
  newContract.EndDate = DateTime.parse(para2);
  newContract.HoursPerDay = double.parse(para3);

  // Calculate values for newContract
  newContract.CalculateTotals();

  // Display newContract
  newContract.DisplayContract();

}
