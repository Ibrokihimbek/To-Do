import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';

import 'package:note/widgets/button_widget.dart';
import 'package:note/widgets/choose_cotegory_widget.dart';
import 'package:note/widgets/flag_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

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

bool isDark = false;

class _UpdateTaskWidgetState extends State<UpdateTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  DateTime? taskDate;
  int? categoryId;
  int? priorityId;

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
          ),
        ),
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(12).r,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: widget.todo.title,
                    onSaved: (val) {
                      newTitle = val ?? "";
                    },
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isDark ? MyColors.C_979797 : Colors.black54,
                            width: 0.8.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isDark ? MyColors.C_979797 : Colors.black54,
                            width: 0.8.w),
                      ),
                      hintText: 'Title'.tr(),
                      hintStyle: TextStyle(
                        color: isDark ? MyColors.C_AFAFAF : Colors.black54,
                      ),
                      filled: true,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    initialValue: widget.todo.description,
                    textInputAction: TextInputAction.newline,
                    maxLines: 2,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                    onSaved: (val) {
                      newDescription = val ?? "";
                    },
                    decoration: InputDecoration(
                        hintText: 'Description'.tr(),
                        hintStyle: FontLatoW400(
                          color: isDark ? MyColors.C_AFAFAF : Colors.black54,
                        ),
                        filled: true,
                        fillColor:
                            isDark ? MyColors.C_363636 : Colors.grey.shade400,
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    taskDate.toString() == "null"
                        ? ""
                        : TimeUtils.formatToMyTime(taskDate!),
                    style:
                        TextStyle(color: isDark ? Colors.white : Colors.black),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
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
                        child: SvgPicture.asset(
                          MyImages.icon_timer,
                          color: isDark ? MyColors.C_FFFFFF : Colors.black,
                        ),
                      ),
                      SizedBox(width: 22.w),
                      ButtonMark(
                        color: isDark ? MyColors.C_FFFFFF : Colors.black,
                        onSelected: (index) {
                          categoryId = index;
                          setState(() {});
                        },
                      ),
                      SizedBox(width: 22.w),
                      ButtonFlag(
                        color: isDark ? MyColors.C_FFFFFF : Colors.black,
                        onSelected: (index) {
                          priorityId = index;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ButtonConiformation(
                    color: isDark ? MyColors.C_FFFFFF : Colors.black,
                    buttonName: 'Update'.tr(),
                    onTap: () {
                      formKey.currentState?.save();
                      var newTodo = TodoModel(
                        id: widget.todo.id,
                        title: newTitle,
                        description: newDescription,
                        date: (taskDate ?? DateTime.parse(widget.todo.date))
                            .toString(),
                        priority: priorityId ?? widget.todo.priority,
                        isCompleted: 0,
                        categoryId: categoryId ?? widget.todo.categoryId,
                      );
                      LocalDatabase.updateTaskById(newTodo);
                      widget.onUpdatedTask();
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutName.main, (route) => false);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
