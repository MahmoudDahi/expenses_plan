import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactionList.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions add yet !',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('\$${transactionList[index].amount.toStringAsFixed(2)}'),
                          )),
                      radius: 30,
                    ),
                    title: Text(
                      transactionList[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactionList[index].date)),
                  ),
                );
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
