import "package:intl/intl.dart";

class AppDateFormatter {
  static String dateFormat(DateTime dateTime) {
    return DateFormat(
      'EEEE, d MMM yyyy hh:mm a',
    ).format(dateTime);
  }
}
