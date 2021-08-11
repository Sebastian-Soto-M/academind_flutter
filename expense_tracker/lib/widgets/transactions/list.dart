import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

import 'list_tile.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => TransactionListTile(transactions[index]),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => Divider(
        thickness: 2,
      ),
    );
    //   children: _transactions.map((e) => TransactionCard(e)).toList(),
    //   scrollDirection: Axis.vertical,
    // );
  }
}
