import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage(this.title);

  List<Transaction> transactions = [
    Transaction(id: 'id0', amount: 55.4, title: 'Buy app', date: DateTime.now()),
    Transaction(id: 'id1', amount: 99.9, title: 'Buy food', date: DateTime.now()),
    Transaction(id: 'id2', amount: 9.55, title: 'Buy tea with mint', date: DateTime.now()),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Text('CHART'),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () {
                          print(amountController.text);
                          print(titleController.text);
                        },
                        child: Text('Add transaction')),
                    margin: EdgeInsets.only(top: 10),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              ...transactions.map((e) => Card(
                    child: Row(children: [
                      Container(
                        child: Text(
                          '\$${e.amount}',
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
                              e.title,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            DateFormat().format(e.date),
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      )
                    ]),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
