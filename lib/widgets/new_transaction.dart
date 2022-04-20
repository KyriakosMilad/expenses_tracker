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
  var _dateController;

  void _addTransaction() {
    widget._addTransactionFunc(_titleController.text, double.parse(_amountController.text), _dateController);

    Navigator.of(context).pop();
  }

  void _showPickDate() {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year), lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateController = pickedDate;
      });
    });
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
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(child: _dateController == null ? Text('No date chosen!') : Text('Date chosen: ${_dateController}')),
                  TextButton(onPressed: _showPickDate, child: Text('Choose Date'))
                ],
              ),
            ),
            Container(
              color: Colors.cyan,
              child: TextButton(
                onPressed: () {
                  _addTransaction();
                },
                child: Text('Add transaction', style: TextStyle(color: Colors.white)),
              ),
              margin: EdgeInsets.only(top: 10),
            )
          ],
        ),
      ),
    );
  }
}
