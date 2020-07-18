import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

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
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
                print(titleController.text);
                print(amountController.text);
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
