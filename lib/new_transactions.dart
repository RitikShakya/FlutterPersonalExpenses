
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titileInput = TextEditingController();

  final amountInput = TextEditingController();
  var selectedDate;

  void onCLick(){
    if(amountInput.text.isEmpty){
      return;
    }

    final titleInput = titileInput.text;
    final amount = double.parse(amountInput.text);

    if(titleInput.isEmpty || amount<=0|| selectedDate==null){
      return;
    }

    widget.addNewTransaction(titleInput,amount,selectedDate);
    Navigator.of(context).pop();

  }
  
  void ChooseDate(BuildContext context){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(2021) , lastDate: DateTime.now()).then((pickedDate){
      if(pickedDate==null){
        return;
      }
      setState((){selectedDate=pickedDate;});

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(

        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(decoration: InputDecoration(labelText: "Title"),controller: titileInput,onSubmitted: (_){onCLick();},),
            TextField(decoration: InputDecoration(labelText: "Amount"),controller: amountInput,keyboardType: TextInputType.number,onSubmitted: (_){onCLick();},),
            SizedBox(height: 10,),
            Row(
              children: [

                Expanded(child: Text(selectedDate ==null?'No Date Chosen : ': 'Picked Date : ${DateFormat.yMd().format(selectedDate)}')),
                FlatButton(onPressed: (){ChooseDate(context);}, child: Text('Select Date', style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),))

              ],
            ),
            SizedBox(height: 5,),
            RaisedButton(onPressed: onCLick, color: Colors.purple,child:Text('Add Transaction', style: TextStyle(color: Colors.white, fontSize: 18),))
          ],
        ),
      ),
    );
  }
}
