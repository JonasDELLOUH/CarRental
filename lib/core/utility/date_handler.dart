import 'package:intl/intl.dart';

class DateHandler {
  // static String myDate(int timestamp) {
  //   String locale = 'en_US';
  //   initializeDateFormatting(locale, '');
  //   DateTime postDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
  //   DateTime now = DateTime.now();
  //   DateFormat format = DateFormat();
  //   if (now.difference(postDate).inDays > 0) {
  //     format = DateFormat.yMMMd(locale);
  //   } else {
  //     // format = DateFormat.Hm(locale);
  //     format = DateFormat.yMMMd(locale);
  //
  //   }
  //   return format.format(postDate).toString();
  // }

  static String dateFormat(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String maDateString = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
    return maDateString;
  }
}
