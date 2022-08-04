import 'dart:ffi';

import 'package:flutter/material.dart';
import './chart.dart';
import './transaction_list.dart';
import 'package:intl/intl.dart';

import './new_transactions.dart';

import './models/Transactions.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
            accentColor: Colors.amber

      ),
    );
  }

}
class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // This widget is the root of your application.


  final List<Transactions> transactions = [
  ];

  
  List<Transactions> get recentTransactions{
    return transactions.where((tx) {
      
      return tx.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
  void addNewTransaction(String title, double amount,DateTime selectedDate) {
    final newTransaction = Transactions(id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: selectedDate);


    setState(() {
      transactions.add(newTransaction);
    });
  }


    void startAddNewTransaction(BuildContext context){
      showModalBottomSheet(context: context, builder: (_){
        return NewTransaction(addNewTransaction);

      });
    }

    void deleteTransaction(String id){
    setState((){
      transactions.removeWhere((tx) {

        return tx.id==id;
      });

    });


    }

    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses",) ,
        actions: [
          IconButton(onPressed: (){startAddNewTransaction(context);},icon: Icon(Icons.add),color: Colors.white,)
        ],



      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Chart(recentTransactions),
          SizedBox(height: 20,),
          TransactionList(transactions,deleteTransaction)
          ,




    ],),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){startAddNewTransaction(context);},),
    );
  }
}


