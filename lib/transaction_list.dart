import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'models/Transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
   final Function deletetx;

  TransactionList(this.transactions,this.deletetx);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,

      child: transactions.isEmpty?Column(children: <Widget>[
        Text('No Transaction Is Added'
        ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        SizedBox(height: 30,),
        Container(height: 200,child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,),)

      ],) :ListView.builder(
        itemBuilder: (context, index)  {



          return Card(
            elevation: 5,

            child: Row(
              children: <Widget>[
                Container(




                    margin: EdgeInsets.only(right: 20,top: 10,bottom: 10,left: 10),


                    width: 80,
                    height: 45,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //shape: BoxShape.circle,


                      border: Border.all(
                        color: Colors.purple,
                        width: 1.5,
                      ),

                    ),
                    child: FittedBox(child: Text('\$${transactions[index].amount.toStringAsFixed(2)}',style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold, color: Colors.deepPurple),))


                ),
                Expanded(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(transactions[index].title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(DateFormat.yMMMd().format(transactions[index].dateTime),style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
                IconButton(onPressed: (){deletetx(transactions[index].id);}, icon: Icon(Icons.delete,color: Colors.purple,))


              ],
            ),
          );


        },itemCount: transactions.length,),
    );

  }
}
