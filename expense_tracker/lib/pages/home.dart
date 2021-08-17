import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/no_content.dart';
import '../models/transaction.dart';
import '../widgets/transactions/index.dart';

class MenuItem {
  final String label;
  final Function action;
  MenuItem(this.label, this.action);
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

  List<MenuItem> get _menuItems {
    return [
      MenuItem(
        'Refresh',
        () => setState(() {
          _transactions.clear();
          _transactions.addAll(List.generate(10,
              (index) => Transaction.create('TRSNCT -> $index', index * 10.0)));
        }),
      ),
      MenuItem(
        'Clear',
        () => setState(() {
          _transactions.clear();
        }),
      ),
    ];
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
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
          PopupMenuButton(
            itemBuilder: (_) => _menuItems
                .map((item) =>
                    PopupMenuItem(value: item, child: Text(item.label)))
                .toList(),
            icon: Icon(Icons.more_vert),
            onSelected: (MenuItem val) => val.action(),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        buttonBackgroundColor: Theme.of(context).primaryColorDark,
        items: <Widget>[
          Icon(Icons.add),
          Icon(Icons.list),
          Icon(Icons.bar_chart),
        ],
        onTap: (index) {
          //Handle button tap
        },
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
                : TransactionList(_transactions, () => setState(() {})),
            flex: 1,
          )
        ],
      ),
    );
  }
}
