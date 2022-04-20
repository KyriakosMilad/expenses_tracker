import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('CHART'),
    );
  }
}
