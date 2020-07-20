import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  TransactionList(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _userTransaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transaction Added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 30,),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
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
                          color: Theme.of(context).primaryColorDark,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text(
                        '\$ ${_userTransaction[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _userTransaction[index].title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          DateFormat.yMMMd()
                              .format(_userTransaction[index].date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              },
              itemCount: _userTransaction.length,
            ),
    );
  }
}
