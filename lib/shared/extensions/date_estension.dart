extension DateExtension on DateTime {
  String get formatDate {
    final formatedDay = day.toString().padLeft(2, '0');
    final formatedMonth = month.toString().padLeft(2, '0');
    final formatedYear = year.toString();

    return '$formatedDay/$formatedMonth/$formatedYear';
  }
}
