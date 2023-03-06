import 'package:flutter/material.dart';
import './new_transactions.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  //const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {


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

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          NewTransaction(addNewTransaction),
          TransactionList(userTransactions)]
    );
  }
}
