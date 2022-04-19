import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTransaction;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  NewTransaction(this._addTransaction);

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
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            ),
            Container(
              child: TextButton(
                  onPressed: () {
                    _addTransaction(_titleController.text, double.parse(_amountController.text), DateTime.now());
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
