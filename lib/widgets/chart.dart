import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get transactionsLastWeek {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        var transaction = transactions[i];
        if (transaction.date.day == weekDay.day && transaction.date.month == weekDay.month && transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      print(weekDay);
      print(totalSum);

      return {
        'day': DateFormat.E(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('CHART'),
    );
  }
}
