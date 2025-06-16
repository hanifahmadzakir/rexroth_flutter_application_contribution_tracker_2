import 'package:flutter/material.dart';
import 'package:flutter_application_contribution_tracker_2/utils/profile_card.dart';
import 'package:flutter_application_contribution_tracker_2/utils/quickActions_row.dart';
import 'package:flutter_application_contribution_tracker_2/utils/section_tile.dart';
import 'package:flutter_application_contribution_tracker_2/utils/task_list.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Hello, John!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Welcome back to your Contribution Tracker Apps",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 25),
              ProfileCard(),
              SizedBox(height: 30),
              QuickActionsRow(),
              SizedBox(height: 30),
              SectionTitle("Task List"),
              TransactionList(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}




// bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.track_changes),
//             label: 'Tracker',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),