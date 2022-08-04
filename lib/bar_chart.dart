import 'package:flutter/material.dart';

class BarCharts extends StatelessWidget {


  final String label;
  final double amountSpending;
  final double percentSpending;

  BarCharts(this.label,this.amountSpending,this.percentSpending);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${amountSpending.toStringAsFixed(0)}')),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0),
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(220, 220,220, 1)

              ),
            ),
            FractionallySizedBox(heightFactor: percentSpending,
              child: Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),),



            ),
            )

          ],),

        ),
        SizedBox(height: 4,),
        Text(label),
      ],
    );
  }
}
