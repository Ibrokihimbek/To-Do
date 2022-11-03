import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToMyTime(DateTime dateTime) {
    final format = DateFormat("hh:mm,  dd-MM-yyyy");
    return format.format(dateTime);
  }
}