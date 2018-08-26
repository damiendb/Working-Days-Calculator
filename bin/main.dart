import 'package:intl/intl.dart';
import 'WAHolidays.dart';

main(List<String> arguments) {

  String para1 = "2018-08-27";
  String para2 = "2019-02-28";
  String para3 = "7.5";
  DateFormat formatter = new DateFormat('EEEE, d MMMM yyyy');

  List<Holidays> inPeriodHolidays = new List<Holidays>();

  DateTime StartDate;
  DateTime EndDate;
  double HoursPerDay;

  StartDate = DateTime.parse(para1);
  EndDate = DateTime.parse(para2);
  HoursPerDay = double.parse(para3);

  int totalDays = 0;
  int totalWeekDays = 0;
  int totalHolidays = 0;
  int totalWorkingDays = 0;
  double totalWorkingHours = 0;

  print("First Day of Contract: " + formatter.format(StartDate));
  print("Last Day of Contract: " + formatter.format(EndDate));
  print("");

  inPeriodHolidays = HolidaysInPeriod(StartDate, EndDate);

  inPeriodHolidays.forEach((value) {
    print(formatter.format(value.pubHoliday) + " is " + value.holDescription);
  });
  print("");

  totalDays = CountTotalDays(StartDate, EndDate);
  totalWeekDays = CountWeekDays(StartDate, EndDate);
  totalHolidays = inPeriodHolidays.length;
  totalWorkingDays = totalWeekDays - totalHolidays;
  totalWorkingHours = totalWorkingDays * HoursPerDay;

  print("Number of Public Holidays during Contract: " + totalHolidays.toString());
  print("Number of Days during Contract: " + totalDays.toString());
  print("Number of Week Days during Contract: " + totalWeekDays.toString());
  print("Number of Working Days during Contract: " + totalWorkingDays.toString());
  print("Number of Working Hours during Contract: " + totalWorkingHours.toString());

}
