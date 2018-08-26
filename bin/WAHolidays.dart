/*

create a class for public holidays
this class has a constructor that takes start and end dates as parameters
constructor builds list of public holidays in the period (based on Global List)
constructor calculates the number of holidays in the period
add a dispose() function to clear out the memory
add a test() function with assert() statements and a super.test() if using class extensions

 */

// Global List of all Public Holidays
// Question: Use a Map? or use a class turned into a List?
class Holidays {

  //int holNum = 0;
  DateTime pubHoliday;
  String holDescription;

}

Holidays addHoliday(int index) {

  Holidays indDay = new Holidays();

  switch (index) {
    case 0:
      indDay.pubHoliday = new DateTime(2018,01,01);
      indDay.holDescription = "New Years Day";
      return indDay;
    case 1:
      indDay.pubHoliday = new DateTime(2018,01,26);
      indDay.holDescription = "Australia Day";
      return indDay;
    case 2:
      indDay.pubHoliday = new DateTime(2018,03,05);
      indDay.holDescription = "Labour Day";
      return indDay;
    case 3:
      indDay.pubHoliday = new DateTime(2018,03,30);
      indDay.holDescription = "Good Friday";
      return indDay;
    case 4:
      indDay.pubHoliday = new DateTime(2018,04,02);
      indDay.holDescription = "Easter Monday";
      return indDay;
    case 5:
      indDay.pubHoliday = new DateTime(2018,04,25);
      indDay.holDescription = "ANZAC Day";
      return indDay;
    case 6:
      indDay.pubHoliday = new DateTime(2018,06,04);
      indDay.holDescription = "WA Day";
      return indDay;
    case 7:
      indDay.pubHoliday = new DateTime(2018,09,24);
      indDay.holDescription = "Queen's Birthday";
      return indDay;
    case 8:
      indDay.pubHoliday = new DateTime(2018,12,25);
      indDay.holDescription = "Christmas Day";
      return indDay;
    case 9:
      indDay.pubHoliday = new DateTime(2018,12,26);
      indDay.holDescription = "Boxing Day";
      return indDay;

    case 10:
      indDay.pubHoliday = new DateTime(2019,01,01);
      indDay.holDescription = "New Years Day";
      return indDay;
    case 11:
      indDay.pubHoliday = new DateTime(2019,01,28);
      indDay.holDescription = "Australia Day";
      return indDay;
    case 12:
      indDay.pubHoliday = new DateTime(2019,03,04);
      indDay.holDescription = "Labour Day";
      return indDay;
    case 13:
      indDay.pubHoliday = new DateTime(2019,04,19);
      indDay.holDescription = "Good Friday";
      return indDay;
    case 14:
      indDay.pubHoliday = new DateTime(2019,04,22);
      indDay.holDescription = "Easter Monday";
      return indDay;
    case 15:
      indDay.pubHoliday = new DateTime(2019,04,25);
      indDay.holDescription = "ANZAC Day";
      return indDay;
    case 16:
      indDay.pubHoliday = new DateTime(2019,06,03);
      indDay.holDescription = "WA Day";
      return indDay;
    case 17:
      indDay.pubHoliday = new DateTime(2019,09,30);
      indDay.holDescription = "Queen's Birthday";
      return indDay;
    case 18:
      indDay.pubHoliday = new DateTime(2019,12,25);
      indDay.holDescription = "Christmas Day";
      return indDay;
    case 19:
      indDay.pubHoliday = new DateTime(2019,12,26);
      indDay.holDescription = "Boxing Day";
      return indDay;


    case 20:
      indDay.pubHoliday = new DateTime(2020,01,01);
      indDay.holDescription = "New Years Day";
      return indDay;
    case 21:
      indDay.pubHoliday = new DateTime(2020,01,27);
      indDay.holDescription = "Australia Day";
      return indDay;
    case 22:
      indDay.pubHoliday = new DateTime(2020,03,02);
      indDay.holDescription = "Labour Day";
      return indDay;
    case 23:
      indDay.pubHoliday = new DateTime(2020,04,10);
      indDay.holDescription = "Good Friday";
      return indDay;
    case 24:
      indDay.pubHoliday = new DateTime(2020,04,13);
      indDay.holDescription = "Easter Monday";
      return indDay;
    case 25:
      indDay.pubHoliday = new DateTime(2020,04,27);
      indDay.holDescription = "ANZAC Day";
      return indDay;
    case 26:
      indDay.pubHoliday = new DateTime(2020,06,01);
      indDay.holDescription = "WA Day";
      return indDay;
    case 27:
      indDay.pubHoliday = new DateTime(2020,09,28);
      indDay.holDescription = "Queen's Birthday";
      return indDay;
    case 28:
      indDay.pubHoliday = new DateTime(2020,12,25);
      indDay.holDescription = "Christmas Day";
      return indDay;
    case 29:
      indDay.pubHoliday = new DateTime(2020,12,28);
      indDay.holDescription = "Boxing Day";
      return indDay;
  }

  return indDay;

}

List<Holidays> populateHolidays(DateTime start, DateTime end) {

  List<Holidays> WAHolidays = new List<Holidays>();
  int totYears = 3;

  for (int i = 0; i < totYears*10; i++) {
    WAHolidays.insert(i, addHoliday(i));
  }

  return WAHolidays;

}


// Have start and end dates passed to the class
// Have a Map(or List) in the same format as WAHolidays
// do a foreach in WAHolidays
//  compare the 'key' with the start and end dates
//  if inside dates then add that WAHolidays element to Map (or List) in the class
List<Holidays> HolidaysInPeriod (DateTime start, DateTime end){

  int i = 0;

  // create the full list of public Holidays
  // this may be replaced with a call to Firebase
  List<Holidays> HolidayList = new List<Holidays>();
  HolidayList = populateHolidays(start, end);

  // build the return list contain just the applicable holidays
  List<Holidays> inPeriodHolidays = new List<Holidays>();

  HolidayList.forEach((value) {
    if (value.pubHoliday.isAfter(start.subtract(const Duration(days: 1))) && value.pubHoliday.isBefore(end.add(const Duration(days: 1)))) {
      inPeriodHolidays.insert(i, value);
      i++;
    }
  });

  return inPeriodHolidays;
}

int CountTotalDays(DateTime start, DateTime end) {

  return end.difference(start).inDays + 1;

}

int CountWeekDays(DateTime start, DateTime end) {

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