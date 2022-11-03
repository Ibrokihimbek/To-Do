import 'package:flutter/material.dart';

import '../database/local_database.dart';
import '../models/todo_model.dart';
import '../utils/time_utils.dart';

class UpdateTaskWidget extends StatefulWidget {
  TodoModel todo;
  VoidCallback onUpdatedTask;

  UpdateTaskWidget({
    Key? key,
    required this.onUpdatedTask,
    required this.todo,
  }) : super(key: key);

  @override
  State<UpdateTaskWidget> createState() => _UpdateTaskWidgetState();
}

class _UpdateTaskWidgetState extends State<UpdateTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  DateTime? taskDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.todo.id.toString()),
            TextFormField(
              initialValue: widget.todo.title,
              onSaved: (val) {
                newTitle = val ?? "";
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              initialValue: widget.todo.description,
              onSaved: (val) {
                newDescription = val ?? "";
              },
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              taskDate.toString() == "null"
                  ? ""
                  : TimeUtils.formatToMyTime(taskDate!),
              style:const TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () async {
                taskDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.parse(widget.todo.date),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2300),
                );
                TimeOfDay? taskTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                    minute: DateTime.parse(widget.todo.date).minute,
                    hour: DateTime.parse(widget.todo.date).hour,
                  ),
                );
                taskDate = DateTime(
                  taskDate!.year,
                  taskDate!.month,
                  taskDate!.day,
                  taskTime!.hour,
                  taskTime.minute,
                );
                setState(() {});
              },
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                formKey.currentState?.save();
                var newTodo = TodoModel(
                  id: widget.todo.id,
                  title: newTitle,
                  description: newDescription,
                  date: taskDate.toString(),
                  priority: "priority",
                  isCompleted: 0,
                );
                LocalDatabase.updateTaskById(newTodo);
                widget.onUpdatedTask();
                Navigator.pop(context);
              },
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}