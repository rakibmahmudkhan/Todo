import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title of the task',
                style: Theme.of(context).textTheme.titleSmall),
            const Text(
              'Title of the task',
            ),
            const Text(
              'Date: 12/12/24',
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTaskStatusChip(),
                Wrap(
                  children: [
                    IconButton(
                        onPressed: _onTapEditButton,
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: _onTapDeleteButton,
                        icon: const Icon(Icons.delete)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapEditButton() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Edit Status"),
            content: Column(
              children: ["new", "Completed", "Cancelled", 'Progress'].map((e) {
                return ListTile(
                  title: Text(e),
                );
              }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Okay'),
              ),
            ],
          );
        });
  }

  void _onTapDeleteButton() {}

  Widget _buildTaskStatusChip() {
    return Chip(
      label: const Text(
        "New",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.themeColor)),
    );
  }
}