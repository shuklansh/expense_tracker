import 'package:flutter/material.dart';
import './main.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
  //const TransactionList({Key? key}) : super(key: key);


  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: userTransactions.map((txSingle) {
          return Card(
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        )),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Text("Rs. ${txSingle.amount.toString()}",
                        style: TextStyle(fontSize: 20, color: Colors.red)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          child: Text(
                            txSingle.title,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Text(
                            DateFormat('dd/MM/yyyy (hh:mm)')
                                .format(txSingle.date),
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.grey),
                          ))
                    ],
                  )
                ],
              ));
        }).toList(),
      )
    );
  }
}
