import 'package:expense_tracker/widgets/no_content.dart';

import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:flutter/services.dart';

import 'widgets/transactions/chart.dart';
import 'widgets/transactions/form.dart';
import 'widgets/transactions/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple,
        fontFamily: "FiraCode",
        textTheme: TextTheme(
          headline1: ThemeData.light().textTheme.headline1.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: "FiraCode",
                fontSize: 28,
              ),
        ),
      ),
      home: HomePage('Expense Tracker'),
    );
  }
}

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

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction.create(title, amount));
    });
    Navigator.of(context).pop();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
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
              icon: Icon(Icons.delete))
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
                : TransactionList(_transactions),
            flex: 1,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
