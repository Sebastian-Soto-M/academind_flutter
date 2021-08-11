import 'package:flutter/material.dart';
import 'package:expense_tracker/models/chart_bar.dart';

class TransactionChartBar extends StatelessWidget {
  final ChartBar bar;
  final DateTime date;
  final double barWidth;
  const TransactionChartBar(this.bar, this.date, [this.barWidth = 10.0]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FittedBox(
            child: Text('\$${bar.current.toStringAsFixed(0)}'),
          ),
          Container(
            height: 80,
            width: barWidth,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                FractionallySizedBox(
                    heightFactor: bar.percentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ))
              ],
            ),
          ),
          Text(bar.label),
        ],
      ),
    );
  }
}
