import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //const NewTransaction({Key? key}) : super(key: key);

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void SubmitData() {

    final titleEntered = title.text;
    final amountEntered = double.parse(Amount.text);

    if( titleEntered.isEmpty || amountEntered <= 0 ){
      return;
    }
      widget.addTx( //refactored when made a stateful widget
        titleEntered,
        amountEntered
    );
    Navigator.of(context).pop(); //to close the top most screen displayed
  }

  final Amount = TextEditingController();

  final title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.fromLTRB(15,15,15,15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
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

            ],
          ),
        ),
      );
  }
}
