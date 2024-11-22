import 'package:flutter/material.dart';
import 'package:todo/data/models/network_response.dart';
import 'package:todo/data/services/network_caller.dart';
import 'package:todo/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:todo/ui/widgets/snack_bar_message.dart';
import 'package:todo/ui/widgets/tm_app_bar.dart';

import '../../data/utils/urls.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TMAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 42,
                  ),
                  Center(
                    child: Text(
                      "Add new Task",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Title"),
                    controller: _titleTEController,
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter a value";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                    maxLines: 6,
                    controller: _descriptionTEController,
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter a Description";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: !_addNewTaskProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                        onPressed: _onTapSubmitButton,
                        child: const Icon(Icons.arrow_circle_right_outlined)),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _addNewTask();
    }
  }

  Future<void> _addNewTask() async {
    _addNewTaskProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New"
    };

    NetworkResponse response = await NetworkCaller.postRequestWithToken(
        url: Urls.addNewTask, body: requestBody);
    _addNewTaskProgress = false;
    setState(() {});
    if (response.isSuccess) {
      _clearTextField();
      showSnackBarMessage(context, "New Task Added!");
    } else {
      showSnackBarMessage(context, response.errorMessage.toString(), true);
    }
  }

  void _clearTextField() {
    _titleTEController.clear();
    _descriptionTEController.clear();
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }

}
