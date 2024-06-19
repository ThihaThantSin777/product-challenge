import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  String get format2PlaceDigitAmount {
    var formatter = NumberFormat('#,##0.00');
    return formatter.format(this);
  }
}
