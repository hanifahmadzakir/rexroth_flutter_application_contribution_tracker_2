import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<Task> transactions = [
    Task("Hydraulic Seal Replacement", "June 10, 2023", -12.99, Icons.gas_meter),
    Task("Oil Change", "June 8, 2023", -5.45, Icons.oil_barrel),
    Task("Test Bench Usage", "June 1, 2023", 2500.00, Icons.ad_units),
    Task("Electrical Wiring", "May 28, 2023", -89.99, Icons.electric_bike),
    Task("Valve Testing", "May 25, 2023", 500.00, Icons.swap_horiz),
  ];

  TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((task) {
        return TaskItem(assignment: task);
      }).toList(),
    );
  }
}

class Task {
  final String title;
  final String date;
  final double amount;
  final IconData icon;

  Task(this.title, this.date, this.amount, this.icon);
}

class TaskItem extends StatelessWidget {
  final Task assignment;

  const TaskItem({super.key, required this.assignment});

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
              color: assignment.amount > 0 
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              assignment.icon,
              color: assignment.amount > 0 ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assignment.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  assignment.date,
                  style: TextStyle(
                    color: Color.fromRGBO(41, 50, 65, 1),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            assignment.amount > 0
              ? "+${assignment.amount.toStringAsFixed(2)}"
              : assignment.amount.toStringAsFixed(2),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: assignment.amount > 0 ? Colors.green : Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}