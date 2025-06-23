import 'package:flutter/material.dart';
import 'package:flutter_application_contribution_tracker_2/pages/dashboard_page.dart';
import 'package:flutter_application_contribution_tracker_2/pages/databasetrial_page.dart';
import 'package:flutter_application_contribution_tracker_2/pages/history_page.dart';
import 'package:flutter_application_contribution_tracker_2/pages/tracker_page.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

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
    DatabaseTrialPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(61, 90, 128, 1),
        centerTitle: true,
        title: Text('Contribution Tracker'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>showDialog(
          context: context, 
          builder: (BuildContext context)=> AlertDialog(
            title: const Text('Please Input Job/Assignment Title'),
                    content: const TextField(),
                    actions: <Widget>[
                      ConfirmationSlider(
                        onConfirmation: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Task Added, Check-in confirmed!')),
                          );
                          Navigator.pop(context);
                        }
                        )
                    ],
          )),
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.add,color: Colors.black,),
        ),
      

      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: Duration(milliseconds: 500),
        maintainBottomViewPadding: false,
        backgroundColor: Color.fromRGBO(152, 193, 217, 1),
        indicatorColor: Color.fromRGBO(238, 108, 77, 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: _navigateBottomBar,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard,color: Colors.black,),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.timeline,color: Colors.black,),
            label: 'Tracker'
          ),
          NavigationDestination(
            icon: Icon(Icons.history,color: Colors.black,),
            label: 'History',
            ),
          NavigationDestination(
            icon: Icon(Icons.android),
            label: 'Developer Tools',
            ),
        ],
      ),

      
    );
  }
}