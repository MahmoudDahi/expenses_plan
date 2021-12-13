import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _transactionsList.add(newTx);
    });
  }

  final List<Transaction> _transactionsList = [
    Transaction(
        id: "id 1", title: "title 1", amount: 80.03, date: DateTime.now()),
    Transaction(
        id: "id 2", title: "title 2", amount: 99.52, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NewTransaction(_addNewTransaction),
          TransactionList(_transactionsList)
        ],
      ),
    );
  }
}
