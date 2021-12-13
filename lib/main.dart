import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Expenses Plan',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses Plan'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                child: Text('chart!'),
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
