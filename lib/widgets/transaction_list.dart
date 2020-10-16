import 'package:flutter/material.dart';
import 'package:FirstApp/models/transaction.dart';

import 'transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList({this.transactions, this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions Added Yet',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting'
                      '.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTransaction: deleteTransaction);
            },
          );
  }
}

// Card(
// child: Row(
// children: [
// Container(
// width: 120,
// margin: EdgeInsets.symmetric(
// vertical: 10,
// horizontal: 15,
// ),
// decoration: BoxDecoration(
// border: Border.all(
// color: Theme.of(context).primaryColor,
// width: 2,
// ),
// ),
// child: Text(
// 'A: \$${transactions[index].amount.toStringAsFixed(2)}',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: Theme.of(context).primaryColor,
// ),
// ),
// padding: EdgeInsets.all(10),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// transactions[index].title,
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// Text(
// DateFormat.yMMMMd().format(
// transactions[index].date), //transaction.date
// // .toString(),
// style: TextStyle(color: Colors.grey),
// )
// ],
// ),
// ],
// ),
// )
