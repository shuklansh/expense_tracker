import 'package:expense_tracker/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/transaction.dart';
import './bar_chart.dart';

class Chart extends StatelessWidget {
  //const Chart({Key? key}) : super(key: key);

  final List<Transaction> transactionsRecent;

  Chart(this.transactionsRecent);

  double get getMaxSpending{
    return groupedListTransactionValues.fold(0.0, (sum, item){
      return sum + (item['amount']as double);
    });
  }

  List<Map<String, Object>> get groupedListTransactionValues {
    return List.generate(7, (index) {
      final WeekDay = DateTime.now().subtract(Duration(days: index));
      double totalSpent= 0.0;
      for (var i = 0; i < transactionsRecent.length; i++) {
        if (transactionsRecent[i].date.day == WeekDay.day &&
            transactionsRecent[i].date.month == WeekDay.month &&
            transactionsRecent[i].date.year == WeekDay.year) {
           totalSpent += transactionsRecent[i].amount;
        }
      }
      print("tagh"+DateFormat.E().format(WeekDay));
      print("tagh"+totalSpent.toString());
      return {
        'day': DateFormat.E().format(WeekDay).substring(0,1),
        'amount': totalSpent
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(12),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedListTransactionValues.map((data){
              // return Text("${data['day']} : ${data['amount']}");
              return BarChart(data['day'].toString(),data['amount']as double, getMaxSpending == 0.0? 0.0 :(data['amount'] as double )/getMaxSpending);
          }).toList(),
          ),
        ));
  }
}
