import 'package:intl/intl.dart';
import 'WAHolidays.dart';

class ContractDuration {

  // Format used for printing dates to the screen
  DateFormat formatter = new DateFormat('EEEE, d MMMM yyyy');

  DateTime StartDate;
  DateTime EndDate;
  double HoursPerDay;

  List<Holidays> _inPeriodHolidays = new List<Holidays>();

  int totalDays = 0;
  int totalWeekDays = 0;
  int totalHolidays = 0;
  int totalWorkingDays = 0;
  double totalWorkingHours = 0.0;

  void CalculateTotals() {

    this._inPeriodHolidays = HolidaysInPeriod(PubHolidayList, this.StartDate, this.EndDate);
    this.totalDays = CountTotalDays(this.StartDate, this.EndDate);
    this.totalWeekDays = CountWeekDays(this.StartDate, this.EndDate);
    this.totalHolidays = this._inPeriodHolidays.length;
    this.totalWorkingDays = this.totalWeekDays - this.totalHolidays;
    this.totalWorkingHours = this.totalWorkingDays * this.HoursPerDay;
  }

  void DisplayContract() {

    print("First Day of Contract: " + formatter.format(this.StartDate));
    print("Last Day of Contract: " + formatter.format(this.EndDate));
    print("Hours per Day: " + this.HoursPerDay.toString());
    print("");

    this._inPeriodHolidays.forEach((value) {
      print(formatter.format(value.pubHoliday) + " is " + value.holDescription);
    });
    print("");

    print("Number of Public Holidays during Contract: " + this.totalHolidays.toString());
    print("Number of Days during Contract: " + this.totalDays.toString());
    print("Number of Week Days during Contract: " + this.totalWeekDays.toString());
    print("Number of Working Days during Contract: " + this.totalWorkingDays.toString());
    print("Number of Working Hours during Contract: " + this.totalWorkingHours.toString());

  }

  static List<Holidays> HolidaysInPeriod (List<Holidays> PHols, DateTime start, DateTime end) {
    int i = 0;

    // build the list containing just the applicable holidays for this period
    List<Holidays> inPeriodHolidays = new List<Holidays>();

    PHols.forEach((value) {
      if (value.pubHoliday.isAfter(start.subtract(const Duration(days: 1))) && value.pubHoliday.isBefore(end.add(const Duration(days: 1)))) {
        inPeriodHolidays.insert(i, value);
        i++;
      }
    });
    return inPeriodHolidays;
  }

  static int CountTotalDays(DateTime start, DateTime end) {
    return end.difference(start).inDays + 1;
  }

  static int CountWeekDays(DateTime start, DateTime end) {
    DateTime counterDay = start;
    int totalDays = 0;

    do {
      if (counterDay.weekday < 6) {
        totalDays++;
      }
      counterDay = counterDay.add(const Duration(days: 1));
    } while (counterDay.isBefore(end.add(const Duration(days: 1))));

    return totalDays;
  }

}