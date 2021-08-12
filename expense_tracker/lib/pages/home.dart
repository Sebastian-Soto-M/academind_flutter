import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/no_content.dart';
import '../models/transaction.dart';
import '../widgets/transactions/index.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction.create('New Phone', 10.00),
    Transaction.create('New Case', 10.00),
    Transaction.create('New Screen Protector', 10.00),
    Transaction.create('New Headphones', 10.00),
  ];

  void _addNewTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(Transaction(title, amount, date: date));
    });
    Navigator.of(context).pop();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
        });
  }

  void _dismissTransaction(DismissDirection direction, int index) {
    setState(() {
      switch (direction) {
        case DismissDirection.endToStart:
          _transactions.removeAt(index);
          break;
        case DismissDirection.startToEnd:
          _transactions.removeAt(index);
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
  }

  void _resetTransactions() {
    setState(() {
      _transactions.clear();
      _transactions.addAll(List.generate(
          10, (index) => Transaction.create('TRSNCT -> $index', index * 10.0)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        actions: [
          IconButton(onPressed: _resetTransactions, icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () => setState(() => _transactions.clear()),
              icon: Icon(Icons.delete)),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (_transactions.isNotEmpty)
            Material(
              child: TransactionChart(_transactions
                  .where((element) => element.date
                      .isAfter(DateTime.now().subtract(Duration(days: 7))))
                  .toList()),
              elevation: 7,
              color: Theme.of(context).primaryColorLight,
            ),
          Expanded(
            child: _transactions.isEmpty
                ? SingleChildScrollView(child: NoContentFound('Transactions'))
                : TransactionList(_transactions, _dismissTransaction),
            flex: 1,
          )
        ],
      ),
    );
  }
}
