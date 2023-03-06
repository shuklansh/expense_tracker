import 'package:expense_tracker/user_transactions.dart';
import 'package:flutter/material.dart';
import 'model/transaction.dart';
import './user_transactions.dart';
import './transaction_list.dart';
import './new_transactions.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transAction = [

  ];
  //onChanged fires for every keystroke
  //you can better use controller

  // late String Amount;
  // late String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expense Tracker App"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.all(12),
              elevation: 6,
              child: Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  "Chart area",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
              child: Column(
                ),
            ),
          UserTransactions()
        ],
      ),
    );
  }
}
