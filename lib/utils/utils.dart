import 'package:intl/intl.dart';

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
