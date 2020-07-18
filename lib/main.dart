import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transaction> transactionList = [
    Transaction(
      id: 't1',
      title: 'Red Chief',
      amount: 45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Sugar',
      amount: 40,
      date: DateTime.now(),
    ),
  ];

  // String title;
  // String amount;

  var titleController = TextEditingController();
  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                'CHART',
              ),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    autocorrect: true,
                    autofocus: true,
                    cursorColor: Colors.cyan,
                    decoration: InputDecoration(
                      labelText: 'Enter Title',
                    ),
                    // onChanged: (value) {
                    //   title = value;
                    //   print(title);
                    // },
                    controller: titleController,
                  ),
                  TextField(
                    autocorrect: true,
                    autofocus: true,
                    cursorColor: Colors.cyan,
                    decoration: InputDecoration(
                      labelText: 'Enter Amount',
                    ),
                    // onChanged: (value) {
                    //   amount = value;
                    //   print(amount);
                    // },
                    controller: amountController,
                  ),
                  FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text('Add Transaction'),
                  ),
                ],
              ),
            ),
            elevation: 5,
          ),
          Column(
            children: transactionList.map((ts) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    child: Text(
                      '\$ ${ts.amount.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ts.title,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(ts.date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
