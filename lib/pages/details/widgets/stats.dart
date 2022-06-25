import 'package:flutter/material.dart';
import 'dart:math';

final _randomTime = Random();

int next(int min, int max) => min + _randomTime.nextInt(max - min);

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: const [
              Text(
                'Trainingsdaten',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.pie_chart_rounded,
                size: 15,
                color: Color(0xff3bc6fa),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:  Row(
            children:  [
              const SizedBox(width: 30),
              InfoStat(
                icon: Icons.timer,
                iconColor: const Color(0xff535bed),
                iconBackground: const Color(0xffe4e7ff),
                time: '-${next(1,3)}min',
                label: 'Zeit',
                value: "${arguments["min"]}:${next(10, 59)}",
              ),
              const SizedBox(width: 15),
              InfoStat(
                icon: Icons.favorite_outline,
                iconColor: const Color(0xffe11e6c),
                iconBackground: const Color(0xffffe4fb),
                time: '+${next(1,8)}bpm',
                label: 'Herzfrequenz',
                value: '131bpm',
              ),
              const SizedBox(width: 15),
              InfoStat(
                icon: Icons.bolt,
                iconColor: const Color(0xffd3b50f),
                iconBackground: const Color(0xfffb4be4),
                time: '-${next(10,16)}kcal',
                label: 'Energieverbrauch',
                value: '169kcal',
              ),
              const SizedBox(width: 30),
            ],
          ),
        )
      ],
    );
  }
}

class InfoStat extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String time;
  final String label;
  final String value;

  const InfoStat({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.time,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xffe1e1e1),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
          ]),
      child: Stack(
        children: [
          StatIcon(
            icon: icon,
            iconColor: iconColor,
            iconBackground: iconBackground,
          ),
          Change(time: time),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Change extends StatelessWidget {
  const Change({
    Key? key,
    required this.time,
  }) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Text(
          time,
          style: const TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}

class StatIcon extends StatelessWidget {
  const StatIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: iconBackground,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(icon, size: 15, color: iconColor),
    );
  }
}