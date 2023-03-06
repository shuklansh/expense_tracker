import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //const NewTransaction({Key? key}) : super(key: key);

  final Function addTx;

  void SubmitData() {

    final titleEntered = title.text;
    final amountEntered = double.parse(Amount.text);

    if( titleEntered.isEmpty || amountEntered <= 0 ){
      return;
    }
      addTx(
        titleEntered,
        amountEntered
    );
  }

  NewTransaction(this.addTx);

  final Amount = TextEditingController();
  final title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Expense for"),
              controller: title,
                onSubmitted: (_)=>SubmitData()
              //onChanged: (val)=>title=val,),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Expense price"),
              controller: Amount,
              onSubmitted: (_)=>SubmitData(),
              //onChanged: (val)=>Amount=val,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 7, 0),
              child: ElevatedButton(
                  onPressed: SubmitData
                    // print("taggg  ${Amount.text}");
                    // print("taggg ${title.text}");
                  ,
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide(width: 3.0, color: Colors.purple),
                      backgroundColor: Colors.purple.shade50,
                      foregroundColor: Colors.purple),
                  child: Text(
                    "Add Transaction",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
