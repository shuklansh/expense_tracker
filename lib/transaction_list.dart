
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
        height: 380,
        child: ListView
            .builder( //ListView is a column with a singlechildScrollView (MUST HAVE A BOUNDED HEIGHT)
          itemBuilder: (ctx, index) {
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
                      child: Text("Rs. ${userTransactions[index].amount.toStringAsFixed(0)}",
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            child: Text(
                              userTransactions[index].title,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18,
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Text(
                              DateFormat('dd/MM/yyyy (hh:mm)')
                                  .format(userTransactions[index].date),
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.grey),
                            ))
                      ],
                    )
                  ],
                )
            );
          },itemCount: userTransactions.length,
        ),
    );
  }
}
