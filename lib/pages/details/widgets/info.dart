import 'package:flutter/material.dart';
import 'dart:math';

final _randomTime = Random();
double next(double min, double max) => min + _randomTime.nextDouble();

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map;
    print(arguments["kcal"]);
    print(arguments["min"]);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        Stats(value: arguments["kcal"].toString(), unit: 'kcal', label: 'Kalorien'),
        Stats(value: next(2.2, 3.8).toStringAsFixed(2), unit: 'km', label: 'Distanz'),
        Stats(value: arguments["min"].toString(), unit: 'min', label: 'Minuten'),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const Stats({
    Key? key,
    required this.value,
    required this.unit,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: unit,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
