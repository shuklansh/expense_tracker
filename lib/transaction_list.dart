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
      height: 350,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text("No Transactions yet"),
                Container(
                  padding: EdgeInsets.fromLTRB(15,15,15,0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/img.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //Image.asset("assets/images/img.png")

                ],
            )
          : ListView.builder(
                  //ListView is a column with a singlechildScrollView (MUST HAVE A BOUNDED HEIGHT)
                  itemBuilder: (ctx, index) {
                    return
                        Card(
                          color: Theme.of(context).primaryColorLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            elevation: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
                                  child: Text(
                                      "Rs. ${userTransactions[index].amount.toStringAsFixed(0)}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColorDark)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        child: Text(
                                      userTransactions[index].title,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
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
                            ));
                  },
                  itemCount: userTransactions.length,
                ),
    );

  }
}
