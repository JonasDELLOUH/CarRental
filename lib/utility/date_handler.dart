import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

class DateHandler {
  static String myDate(int timestamp) {
    String locale = 'en_US';
    initializeDateFormatting(locale, '');
    DateTime postDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateTime now = DateTime.now();
    DateFormat format = DateFormat();
    if (now.difference(postDate).inDays > 0) {
      format = DateFormat.yMMMd(locale);
    } else {
      // format = DateFormat.Hm(locale);
      format = DateFormat.yMMMd(locale);

    }
    return format.format(postDate).toString();
  }

  static String dateFormat(int timestamp){
    return "27/12/2022";
  }
}
