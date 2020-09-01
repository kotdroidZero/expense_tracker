import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function deleteTransaction;
  TransactionList(this._userTransaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        child: _userTransaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No Transaction Added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  var ts = _userTransaction[index];
                  return TransactionItem(ts: ts, deleteTransaction: deleteTransaction);
                },
                itemCount: _userTransaction.length,
              ),
      );
    });
  }
}