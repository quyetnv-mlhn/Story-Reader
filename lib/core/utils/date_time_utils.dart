import 'package:intl/intl.dart';
import 'package:story_reader/core/utils/constants.dart';

class DateTimeUtils {
  static String getFormattedDate(String? time) {
    final dateTime = DateTime.tryParse(time ?? '');
    if (dateTime == null) {
      return '';
    }
    return DateFormat(AppConstants.defaultDateFormat).format(dateTime);
  }
}
