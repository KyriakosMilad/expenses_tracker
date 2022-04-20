import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amount;
  final double percentage;

  ChartBar({required this.day, required this.amount, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${amount.toStringAsFixed(2)}')),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black54, width: 1), color: Colors.black38),
              ),
              FractionallySizedBox(
                heightFactor: percentage / 100,
                child: Container(
                  decoration: BoxDecoration(color: Colors.cyan),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(day),
      ],
    );
  }
}
