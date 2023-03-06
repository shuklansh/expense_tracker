import 'dart:ffi';

import 'package:expense_tracker/chart.dart';
import 'package:flutter/material.dart';
import './model/transaction.dart';
import './transaction_list.dart';
import './new_transactions.dart';
import './chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple, accentColor: Colors.deepPurple),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<Transaction> transAction = [
  //
  // ];

  final List<Transaction> userTransactions = [
    // Transaction(
    //   id: "t1",
    //   title: "new shoes",
    //   amount: 1500,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "grocery",
    //   amount: 2000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "grocery",
    //   amount: 2000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "grocery",
    //   amount: 2000,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get transactionsRecent {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addNewTransaction(String titletx, double amounttx) {
    final TxNew = Transaction(
        id: DateTime.now().toString(),
        title: titletx,
        amount: amounttx,
        date: DateTime.now());

    setState(() {
      userTransactions.add(TxNew);
    });
  }

  //onChange d fires for every keystroke
  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))),
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 1000.0,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Center(
                    child: NewTransaction(addNewTransaction),
                  )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Expense Tracker App",
          style: TextStyle(color: Colors.deepPurple),
        ),
        actions: [
          IconButton(
              onPressed: () => startNewTransaction(context),
              icon: const Icon(
                Icons.add,
                color: Colors.deepPurple,
              ))
        ],
      ),
      body: Column(
        children: [
          Chart(transactionsRecent),
          // Container(
          //   //padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
          //   width: double.infinity,
          //   child: Card(
          //     color: Theme.of(context).primaryColorLight,
          //     margin: EdgeInsets.all(10),
          //     elevation: 6,
          //     child: Container(
          //       margin: EdgeInsets.all(12),
          //       child: const Text(
          //         "Chart area",
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   margin: EdgeInsets.all(10),
          //     child: Column(
          //       ),
          //   ),
          TransactionList(userTransactions)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
