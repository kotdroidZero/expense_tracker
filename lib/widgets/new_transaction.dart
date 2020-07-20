import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTransaction() {
    final titleEntered = titleController.text;
    final amountEntered = double.parse(amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0) {
      return;
    }

    widget.addTransaction(
        titleController.text, double.parse(amountController.text));

    // closes the BottomSheet Dialog
    // here context is the property available in class itself like widget is available.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
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
              controller: titleController,
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              cursorColor: Colors.cyan,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: submitTransaction,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
