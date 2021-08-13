import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function _onSubmit;

  TransactionForm(this._onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate = null;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  void _submit() {
    if (titleController.text.isEmpty ||
        amountController.text.isEmpty ||
        _selectedDate == null) return;
    final txtTitle = titleController.text;
    final dblAmount = double.parse(amountController.text);
    if (!dblAmount.isNegative)
      widget._onSubmit(txtTitle, dblAmount, _selectedDate);
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
                  onSubmitted: (_) => _submit(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: amountController,
                  onSubmitted: (_) => _submit(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Card(
                    child: ListTile(
                      title: Text(_selectedDate == null
                          ? 'Pick a Date'
                          : DateFormat.yMMMMd('en_US').format(_selectedDate)),
                      leading: Icon(
                        Icons.schedule,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () => _presentDatePicker(),
                    ),
                    elevation: 3,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Save'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).accentColor),
                  alignment: Alignment.centerRight,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
