import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './bar_chart.dart';
import 'models/Transactions.dart';

class Chart extends StatelessWidget {

  final List<Transactions> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String,Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totoalSum =0.0;
      for(var i=0;i<recentTransactions.length;i++){
        if(recentTransactions[i].dateTime.day==weekDay.day &&recentTransactions[i].dateTime.month==weekDay.month
        &&recentTransactions[i].dateTime.year==weekDay.year){
          totoalSum+=recentTransactions[i].amount;
        }

      }
      print(DateFormat.E().format(weekDay));
      print(totoalSum);
      return {'day': DateFormat.E().format(weekDay), 'amount':totoalSum};

    }).reversed.toList();

  }

  double get maxSpending{
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue+(element['amount'] as double);
    });
}


  @override
  Widget build(BuildContext context) {
    return Card(elevation: 10,
    margin: EdgeInsets.all(5),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
          groupedTransactionValues.map((data){
            return Flexible(
              fit: FlexFit.tight,
              child: BarCharts((data['day']as String),(data['amount'] as double),
                  maxSpending==0.0 ? 0.0 :(data['amount']as double)/maxSpending ),
            );

          }).toList(),



      ),
    ),
    );
  }
}
