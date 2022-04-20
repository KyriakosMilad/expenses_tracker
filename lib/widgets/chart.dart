import 'package:expenses_tracker/models/transaction.dart';
import 'package:expenses_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  var totalAmountLastWeek = 0.0;

  List<Map<String, Object>> get transactionsLastWeek {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        var transaction = transactions[i];
        if (transaction.date.day == weekDay.day && transaction.date.month == weekDay.month && transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
          totalAmountLastWeek += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  double getDayPercentage(double amount) {
    if (amount == 0.0 && totalAmountLastWeek == 0.0) {
      return 0.0;
    }
    return (amount / totalAmountLastWeek) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ...transactionsLastWeek
              .map((t) => ChartBar(day: t['day'].toString(), amount: t['amount'] as double, percentage: getDayPercentage(t['amount'] as double))),
        ],
      ),
    );
  }
}
