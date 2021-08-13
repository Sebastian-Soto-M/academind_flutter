import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

import 'list_tile.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function onUpdate;
  TransactionList(this.transactions, [this.onUpdate]);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  void _dismissTransaction(DismissDirection direction, int index) {
    setState(() {
      switch (direction) {
        case DismissDirection.endToStart:
          widget.transactions.removeAt(index);
          break;
        case DismissDirection.startToEnd:
          widget.transactions.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You did it!'),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 2,
              behavior: SnackBarBehavior.floating,
            ),
          );
          break;
        default:
      }
    });
    widget.onUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Colors.lime,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.check, color: Colors.white),
          ),
          alignment: AlignmentDirectional.centerStart,
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Delete',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.red.shade100),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.delete,
                  color: Colors.red.shade100,
                ),
              ),
            ],
          ),
          alignment: AlignmentDirectional.centerEnd,
        ),
        child: TransactionListTile(widget.transactions[index]),
        key: ValueKey(widget.transactions[index].id),
        onDismissed: (direction) => _dismissTransaction(direction, index),
        dismissThresholds: {
          DismissDirection.endToStart: 0.5,
          DismissDirection.startToEnd: 0.2
        },
      ),
      itemCount: widget.transactions.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, __) => Divider(
        thickness: 2,
        height: 2,
      ),
    );
  }
}
