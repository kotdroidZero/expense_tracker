import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitTransaction() {
    final titleEntered = _titleController.text;
    final amountEntered = double.parse(_amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(_titleController.text,
        double.parse(_amountController.text), _selectedDate);

    // closes the BottomSheet Dialog
    // here context is the property available in class itself like widget is available.
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      } else {
        setState(() {
          _selectedDate = date;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autocorrect: true,
                autofocus: false,
                cursorColor: Colors.cyan,
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                ),
                controller: _titleController,
              ),
              TextField(
                autocorrect: true,
                autofocus: true,
                cursorColor: Colors.cyan,
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitTransaction(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Choosen'
                            : DateFormat.yMMMd().format(_selectedDate),
                      ),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            child: Text(
                              'Choose Date',
                            ),
                            onPressed:_openDatePicker ,
                          )
                        : FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: _openDatePicker,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                  ],
                ),
              ),
              RaisedButton(
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitTransaction,
                color: Theme.of(context).primaryColor,
                child: Text('Add Transaction'),
              ),
            ],
          ),
        ),
        elevation: 5,
      ),
    );
  }
}
