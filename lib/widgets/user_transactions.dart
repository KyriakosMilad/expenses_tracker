import 'package:expenses_tracker/models/transaction.dart';
import 'package:expenses_tracker/widgets/new_transaction.dart';
import 'package:expenses_tracker/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(id: 'id0', amount: 55.4, title: 'Buy app', date: DateTime.now()),
    Transaction(id: 'id1', amount: 99.9, title: 'Buy food', date: DateTime.now()),
    Transaction(id: 'id2', amount: 9.55, title: 'Buy tea with mint', date: DateTime.now())
  ];

  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      transactions.add(Transaction(id: 'id', amount: amount, title: title, date: date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addTransaction), TransactionsList(transactions)],
    );
  }
}
