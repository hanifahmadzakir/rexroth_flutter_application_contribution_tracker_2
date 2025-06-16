import 'package:flutter/material.dart';

class QuickActionsRow extends StatelessWidget {
  final List<QuickAction> actions = [
    QuickAction(Icons.send, "Transfer", Colors.blue),
    QuickAction(Icons.qr_code_scanner, "Pay", Colors.green),
    QuickAction(Icons.add, "Top Up", Colors.orange),
    QuickAction(Icons.money, "Bills", Colors.purple),
  ];

   QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((action) {
        return QuickActionButton(action: action);
      }).toList(),
    );
  }
}

class QuickAction {
  final IconData icon;
  final String label;
  final Color color;

  QuickAction(this.icon, this.label, this.color);
}

class QuickActionButton extends StatelessWidget {
  final QuickAction action;

  const QuickActionButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: action.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            action.icon,
            color: action.color,
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          action.label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}