import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionListTile(this.transaction);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:
            Icon(Icons.label_important, color: Theme.of(context).primaryColor),
        trailing: Chip(
          backgroundColor: Theme.of(context).accentColor,
          label: Text(('\$${transaction.amount.toStringAsFixed(2)}'),
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
              style: Theme.of(context).accentTextTheme.button),
        ),
        title: Text(transaction.title),
        subtitle: Text(
          DateFormat.yMMMMd('en_US').format(transaction.date),
        ));
    // return Card(
    //   elevation: 1,
    //   child: Container(
    //     padding: EdgeInsets.all(16),
    //     child: Flex(
    //       direction: Axis.horizontal,
    //       children: [
    //         Container(
    //           margin: EdgeInsets.only(right: 16),
    //           child: Text(
    //             ('\$${transaction.amount.toStringAsFixed(2)}'),
    //             textScaleFactor: 2,
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               color: Theme.of(context).primaryColor,
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 4,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 transaction.title,
    //                 textScaleFactor: 1.5,
    //                 style: TextStyle(fontWeight: FontWeight.w500),
    //               ),
    //               Text(
    //                 DateFormat.yMMMMd('en_US').format(transaction.date),
    //                 style: TextStyle(color: Colors.black45),
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
