import 'package:flutter/material.dart';
import 'package:expense_tracker/models/chart_bar.dart';

class TransactionChartBar extends StatelessWidget {
  final ChartBar bar;
  final DateTime date;
  const TransactionChartBar(this.bar, this.date);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: constraints.maxHeight * 0.25,
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: FittedBox(
              child: Text('\$${bar.current.toStringAsFixed(0)}'),
            ),
          ),
          Container(
            width: constraints.maxWidth * 0.2,
            height: constraints.maxHeight * 0.5,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                FractionallySizedBox(
                    heightFactor: bar.percentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ))
              ],
            ),
          ),
          Text(bar.label),
        ],
      ));
    });
  }
}
