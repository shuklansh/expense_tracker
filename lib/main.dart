// import 'dart:html';

import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(

        primaryColorDark: Color.fromRGBO(59,44,61,1),
          primarySwatch: Colors.purple,
          accentColor: Colors.deepPurple,
          // errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))
      ),
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              )
            ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,0),
                child: Center(child: NewTransaction(_addNewTransaction)),
              )),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {

    final appbar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
        'Personal',
        textAlign: TextAlign.center,
        style: TextStyle(
        color: Theme.of(context).primaryColorDark,
        ),
        ),
        Text(" Expenses",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).primaryColor
        )),
      ],
    ),
    // actions: <Widget>[
    // IconButton(
    // icon: Icon(Icons.add,color: Theme.of(context).primaryColorDark),
    // onPressed: () => _startAddNewTransaction(context),
    // ),
    // ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height - (appbar.preferredSize.height + MediaQuery.of(context).padding.top)) *0.32 ,
                child: Chart(_recentTransactions)),
            Container(
                height: (MediaQuery.of(context).size.height - (appbar.preferredSize.height+ MediaQuery.of(context).padding.top ) ) *0.68 ,
                child: TransactionList(_userTransactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
      Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.all( Radius.circular(40)
            )
        ),
        child: FloatingActionButton.extended(
          isExtended: true,

          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(Icons.add),
          label: Text("Expense"),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}
