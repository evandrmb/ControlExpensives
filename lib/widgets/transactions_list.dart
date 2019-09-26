import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;
  TransactionList(this.userTransactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Sem gastos!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              userTransactions[index].title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              DateFormat('dd/MM/yyyy - HH:mm')
                                  .format(userTransactions[index].date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).errorColor,
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTx(userTransactions[index].id),
                      ),
                    ],
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
