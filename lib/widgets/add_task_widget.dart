import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note/models/cotegory_model.dart';
import 'package:note/widgets/choose_cotegory_widget.dart';
import 'package:note/widgets/flag_widget.dart';

import 'package:note/widgets/text_style_widget.dart';

import '../database/local_database.dart';
import '../models/todo_model.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/time_utils.dart';

class AddTaskWidget extends StatefulWidget {
  VoidCallback onNewTask;
  AddTaskWidget({super.key, required this.onNewTask});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

bool isDark = false;

class _AddTaskWidgetState extends State<AddTaskWidget> {
  var addTitleController = TextEditingController();
  var addSescriptioneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  DateTime? taskDay;
  TimeOfDay? taskTime;
  int categoryId = -1;
  int priorityId = 0;

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(24).r,
        height: 340.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task'.tr(),
                style: FontLatoW700().copyWith(
                  fontSize: 20,
                  color: isDark
                      ? MyColors.C_FFFFFF.withOpacity(0.87)
                      : Colors.black.withOpacity(0.87),
                ),
              ),
              SizedBox(height: 14.h),
              TextFormField(
                textInputAction: TextInputAction.newline,
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter title'.tr();
                },
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                ),
                onSaved: (val) {
                  newTitle = val ?? "";
                },
                decoration: InputDecoration(
                  counterStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                  hintText: 'Title'.tr(),
                  hintStyle: FontLatoW400(
                    color: isDark ? MyColors.C_AFAFAF : Colors.black54,
                  ),
                  filled: true,
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
                  border: const OutlineInputBorder(),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.newline,
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter description';
                },
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
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          taskDay = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2300),
                          );
                          taskTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          taskDay = DateTime(
                            taskDay?.year ?? 0000,
                            taskDay?.month ?? 00,
                            taskDay?.day ?? 00,
                            taskTime?.hour ?? 00,
                            taskTime?.minute ?? 00,
                          );
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
                          }),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        if (newTitle.isNotEmpty &&
                            taskDay != null &&
                            categoryId != -1) {
                          var newTodo = TodoModel(
                            title: newTitle,
                            description: newDescription,
                            date: (taskDay ?? DateTime.now()).toString(),
                            priority: priorityId,
                            isCompleted: 0,
                            categoryId: categoryId,
                          );
                          LocalDatabase.insertToDatabase(newTodo);
                          widget.onNewTask();
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("You made a mistake".tr()),
                              content: Text(
                                  "Complete the other sections below as well\n\n⏱ 📎 🚩"
                                      .tr()),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "ok".tr(),
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: SvgPicture.asset(MyImages.icon_send),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
