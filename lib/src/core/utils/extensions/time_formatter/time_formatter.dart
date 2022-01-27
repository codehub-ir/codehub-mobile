import 'package:codehub/src/core/utils/extensions/persian_utils/persian_utils.dart';
import 'package:intl/intl.dart';

extension TimeFormatter on DateTime {
  String formatToHumanForm() {
    return DateFormat('yyyy-MM-dd').format(this).numberToFa();
  }
}
