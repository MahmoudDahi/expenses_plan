import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function removeTx;

  TransactionList(this.transactionList, this.removeTx);

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? LayoutBuilder(builder: (ctx, constrian) {
            return Column(
              children: [
                Text(
                  'No transactions add yet !',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constrian.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                          child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                            '\$${transactionList[index].amount.toStringAsFixed(2)}'),
                      )),
                      radius: 30,
                    ),
                    title: Text(
                      transactionList[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactionList[index].date)),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? TextButton.icon(
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).errorColor),
                            onPressed: () =>
                                removeTx(transactionList[index].id),
                          )
                        : IconButton(
                            color: Theme.of(context).errorColor,
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                removeTx(transactionList[index].id),
                          )),
              );
            },
            itemCount: transactionList.length,
          );
  }
}
