
import 'package:flutter/material.dart';
import './model/transaction.dart';
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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<Transaction> transAction = [
  //
  // ];

  final List<Transaction> userTransactions = [
    Transaction(
      id: "t1",
      title: "new shoes",
      amount: 1500,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "grocery",
      amount: 2000,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "grocery",
      amount: 2000,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "grocery",
      amount: 2000,
      date: DateTime.now(),
    ),
  ];

  void addNewTransaction(String titletx, double amounttx) {
    final TxNew = Transaction(id: DateTime.now().toString(),
        title: titletx,
        amount: amounttx,
        date: DateTime.now());

    setState(() {
      userTransactions.add(TxNew);
    });
  }


  //onChange d fires for every keystroke
  void startNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){

      return GestureDetector(
        onTap: (){},
      child : NewTransaction(addNewTransaction),
      behavior: HitTestBehavior.opaque,);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expense Tracker App"),
        actions: [
          IconButton(onPressed:()=>startNewTransaction(context), icon: Icon(Icons.add,color: Colors.amberAccent,))
        ],
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
      floatingActionButton: FloatingActionButton(onPressed:()=>startNewTransaction(context),
      child: Icon(Icons.add),),
    );
  }
}
