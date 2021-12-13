import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;

  TransactionList(this._transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    '\$${_transactionList.elementAt(index).amount}',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.purple)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _transactionList.elementAt(index).title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd()
                          .format(_transactionList.elementAt(index).date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _transactionList.length,
      ),
    );
  }
}
