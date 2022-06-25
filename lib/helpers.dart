import 'dart:math';

final Map<int, String> daysOfWeek = {
  1: 'Mon',
  2: 'Die',
  3: 'Mit',
  4: 'Don',
  5: 'Fre',
  6: 'Sam',
  7: 'Son',
};

int randBetween(int min, int max) {
  return Random().nextInt(max - min) + min;
}

String formatNumber(int number) {
  return number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}
