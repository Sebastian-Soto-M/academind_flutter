import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {
  final Function _onSubmit;

  TransactionForm(this._onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) return;
    final txtTitle = titleController.text;
    final dblAmount = double.parse(amountController.text);
    if (!dblAmount.isNegative) widget._onSubmit(txtTitle, dblAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Add a new Transaction!',
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_) => submit(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: amountController,
                  onSubmitted: (_) => submit(),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: submit,
            child: Text('Save'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).accentColor),
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}
