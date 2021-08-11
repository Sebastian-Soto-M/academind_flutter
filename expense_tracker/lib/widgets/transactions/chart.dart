import 'package:expense_tracker/models/chart_bar.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/transactions/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionChart(this.transactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < transactions.length; i++) {
        final current = transactions[i];
        if (current.date.day == weekDay.day &&
            current.date.month == weekDay.month &&
            current.date.year == weekDay.year) {
          totalSum += current.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
        'date': weekDay,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, e) => sum + e['amount']);
  }

  List<Flexible> get chartBars {
    var bars = groupedTransactionValues
        .map((e) => TransactionChartBar(
            ChartBar(
                label: e['day'],
                current: (e['amount'] as double),
                total: totalSpending),
            e['date']))
        .toList();
    bars.sort((a, b) => a.date.weekday.compareTo(b.date.weekday));
    return bars
        .map((e) => Flexible(
              child: e,
              fit: FlexFit.tight,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: chartBars,
        ),
      ),
    );
  }
}
