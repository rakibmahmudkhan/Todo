import 'package:flutter/material.dart';
import 'package:todo/ui/screens/add_new_task_screen.dart';
import 'package:todo/ui/utils/app_color.dart';

import '../widgets/task_card.dart';
import '../widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const TaskCard();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddFab,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TaskSummaryCard(
                title: "New",
                count: 9,
              ),
              TaskSummaryCard(
                title: "Completed",
                count: 9,
              ),
              TaskSummaryCard(
                title: "Cancelled",
                count: 9,
              ),
              TaskSummaryCard(
                title: "Progresses",
                count: 9,
              ),
            ],
          ),
        ));
  }

  void _onTapAddFab() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddNewTaskScreen()));
  }
}


