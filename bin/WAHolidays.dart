/*

create a class for public holidays
this class has a constructor that takes start and end dates as parameters
constructor builds list of public holidays in the period (based on Global List)
constructor calculates the number of holidays in the period
add a dispose() function to clear out the memory
add a test() function with assert() statements and a super.test() if using class extensions

 */

// Use a Map? or use a class turned into a List?
var WAHolidays = {

  '2018-01-01': "New Year's Day",
  '2018-01-27': "Australia Day Holiday",
  '2018-03-02': "Labour Day"
};

class HolidaysInPeriod{

  int intHolidayCount = 0;

  // Constructor for the Class
  Pub_Holidays() {
    print(intHolidayCount);
  }

}