extension StrintExtension on String {
  DateTime toDate() {
    final date = DateTime.parse(this);
    return date;
  }

  String formatCardNumber() {
    if (length < 4) return this;
    String lastFourDigits = substring(length - 4);
    return '********$lastFourDigits';
  }
}
