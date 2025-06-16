import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction("Netflix", "June 10, 2023", -12.99, Icons.tv),
    Transaction("Starbucks", "June 8, 2023", -5.45, Icons.coffee),
    Transaction("Salary", "June 1, 2023", 2500.00, Icons.work),
    Transaction("Amazon", "May 28, 2023", -89.99, Icons.shopping_bag),
    Transaction("Transfer", "May 25, 2023", 500.00, Icons.swap_horiz),
  ];

  TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return TransactionItem(transaction: transaction);
      }).toList(),
    );
  }
}

class Transaction {
  final String title;
  final String date;
  final double amount;
  final IconData icon;

  Transaction(this.title, this.date, this.amount, this.icon);
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: transaction.amount > 0 
                ? Colors.green.withOpacity(0.1)
                : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              transaction.icon,
              color: transaction.amount > 0 ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  transaction.date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction.amount > 0
              ? "+${transaction.amount.toStringAsFixed(2)}"
              : transaction.amount.toStringAsFixed(2),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: transaction.amount > 0 ? Colors.green : Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}