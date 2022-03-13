import 'package:intl/intl.dart';

double convertCelsiusToFahrenheit(double celsius) {
  return celsius * (9.0 / 5.0) + 32.0;
}

enum ConfigureDate {
  weekDay,
  weekAbbrDay,
}

String parseDateToWeekDay({required String day, ConfigureDate configureDate = ConfigureDate.weekDay}) {
  DateTime date = DateTime.parse(day);

  if(configureDate == ConfigureDate.weekDay){
    return DateFormat('EEEE').format(date);
  }

  return DateFormat('E').format(date);
}

String dateFormatted(DateTime dateTime) {
  DateFormat formatter = DateFormat('yyyy/MM/dd');
  return formatter.format(dateTime);
}
