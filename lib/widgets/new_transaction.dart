import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
      ),
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(185, 185, 185, 0.3),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Title' , border: InputBorder.none,),
                    controller: _titleController,
                    onSubmitted: (_) => _submitData(),
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,22,0,0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(185, 185, 185, 0.3),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Amount' , border: InputBorder.none,),
                    controller: _amountController,
                    onSubmitted: (_) => _submitData(),
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12,22,12,12),
              child: Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        side: BorderSide(
                          color: Theme.of(context).primaryColorDark,width: 2
                        ),
                        backgroundColor: Theme.of(context).primaryColorLight,
                        foregroundColor: Theme.of(context).primaryColorDark,
                      ),
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                )
              ),
              child: Text('Add Transaction'),
              //color: Theme.of(context).primaryColor,
              //textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
