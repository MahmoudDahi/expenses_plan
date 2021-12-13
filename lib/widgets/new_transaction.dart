import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function txHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.txHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              child: Text(
                'Add Transaction',
              ),
              onPressed: () => txHandler(
                titleController.text,
                double.parse(amountController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
