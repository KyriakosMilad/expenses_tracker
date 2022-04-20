import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayLetter;
  final double amount;
  final double percentage;

  ChartBar({required this.dayLetter, required this.amount, required this.percentage});

  @override
  Widget build(BuildContext context) {
    print(percentage);
    return Column(
      children: [
        Text(dayLetter),
        SizedBox(
          height: 5,
        ),
        Text(amount.toString()),
        SizedBox(
          height: 5,
        ),
        Text(percentage.toString()),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
