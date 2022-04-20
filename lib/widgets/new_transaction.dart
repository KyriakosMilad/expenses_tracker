import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransactionFunc;

  NewTransaction(this._addTransactionFunc);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _addTransaction() {
    widget._addTransactionFunc(_titleController.text, double.parse(_amountController.text), DateTime.now());

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            Container(
              child: TextButton(
                  onPressed: () {
                    _addTransaction();
                  },
                  child: Text('Add transaction')),
              margin: EdgeInsets.only(top: 10),
            )
          ],
        ),
      ),
    );
  }
}
