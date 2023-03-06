import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  //const BarChart({Key? key}) : super(key: key);

  final String label;
  final double spendingamount;
  final double percentageoftotal;

  BarChart(this.label,this.spendingamount,this.percentageoftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${spendingamount.toStringAsFixed(0)}"),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color : Colors.black12, width: 2.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius:  BorderRadius.circular(12),
                ),
              ),
              FractionallySizedBox(heightFactor: percentageoftotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),)
            ],
          ),
        ),
        SizedBox(height: 4),
        Text("$label"),
      ],
    );
  }
}
