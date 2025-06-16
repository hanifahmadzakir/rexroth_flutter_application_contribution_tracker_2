import 'package:flutter/material.dart';
import 'package:flutter_application_contribution_tracker_2/pages/dashboard_page.dart';
import 'package:flutter_application_contribution_tracker_2/pages/history_page.dart';
import 'package:flutter_application_contribution_tracker_2/pages/tracker_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _navigateBottomBar (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    DashboardPage(),
    TrackerPage(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Contribution Tracker'),
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blueGrey,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _navigateBottomBar,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard,color: Colors.white,),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.timeline),
            label: 'Tracker'
          ),
          NavigationDestination(
            icon: Icon(Icons.history), 
            label: 'History',
            ),
        ],
      ),

      
    );
  }
}