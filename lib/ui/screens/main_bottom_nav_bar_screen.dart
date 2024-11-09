import 'package:flutter/material.dart';
import 'package:todo/ui/screens/cancelled_task_screen.dart';
import 'package:todo/ui/screens/completed_task_screen.dart';
import 'package:todo/ui/screens/new_task_screen.dart';
import 'package:todo/ui/screens/progress_task_screen.dart';

import '../utils/app_color.dart';

import '../widgets/tm_appbar.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const NewTaskScreen(),
    const CompletedTaskScreen(),
    const CancelledTaskScreen(),
    const ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.new_label), label: "new"),
          NavigationDestination(
              icon: Icon(Icons.check_box), label: "Completed"),
          NavigationDestination(icon: Icon(Icons.close), label: "Cancelled"),
          NavigationDestination(
              icon: Icon(Icons.access_time_filled_outlined), label: "Progress"),
        ],
      ),
    );
  }
}


