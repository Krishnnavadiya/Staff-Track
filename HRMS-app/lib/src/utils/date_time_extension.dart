import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormatedDate() {
    final date = DateFormat('MMMM dd, yyyy').format(this);
    return date;
  }

  String toShortFormatedDate({bool isApi = false}) {
    final date = DateFormat('dd/MM/yyyy').format(toLocal());
    return date;
  }

  String toApiCallFormate() {
    final date = DateFormat('yyyy-MM-dd').format(this);
    return date;
  }
}
