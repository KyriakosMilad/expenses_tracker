import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final Function _removeTransactionFunc;
  final List<Transaction> _transactions;

  TransactionsList(this._transactions, this._removeTransactionFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (ctx, idx) {
          return Card(
            child: Row(children: [
              Container(
                child: Text(
                  '\$${_transactions[idx].amount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black45,
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      _transactions[idx].title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    DateFormat().format(_transactions[idx].date),
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              Container(
                child: IconButton(
                    onPressed: () {
                      _removeTransactionFunc(_transactions[idx]);
                    },
                    icon: Icon(Icons.delete)),
              )
            ]),
          );
        },
      ),
    );
  }
}
