import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note/widgets/texfield_widget.dart';
import 'package:note/widgets/text_style_widget.dart';
import 'package:numberpicker/numberpicker.dart';

import '../database/local_database.dart';
import '../models/todo_model.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class AddTaskWidget extends StatefulWidget {
  VoidCallback onNewTask;
  AddTaskWidget({super.key, required this.onNewTask});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  var addTitleController = TextEditingController();
  var addSescriptioneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(24).r,
        height: 312.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: MyColors.C_363636,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: FontLatoW700().copyWith(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 14.h),
              TextFormField(
                textInputAction: TextInputAction.newline,
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter title';
                },
                style: const TextStyle(color: MyColors.C_FFFFFF),
                onSaved: (val) {
                  newTitle = val ?? "";
                },
                decoration: InputDecoration(
                  counterStyle: const TextStyle(color: MyColors.C_FFFFFF),
                  hintText: 'Title',
                  hintStyle: FontLatoW400(color: MyColors.C_FFFFFF),
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: MyColors.C_979797, width: 0.8),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: MyColors.C_979797, width: 0.8),
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
                style: const TextStyle(color: MyColors.C_FFFFFF),
                onSaved: (val) {
                  newDescription = val ?? "";
                },
                decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: FontLatoW400(color: MyColors.C_AFAFAF),
                    filled: true,
                    fillColor: MyColors.C_363636,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.C_363636, width: 0.8),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.C_363636, width: 0.8),
                    ),
                    border: InputBorder.none),
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.icon_timer),
                      ),
                      SizedBox(width: 22.w),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.icon_tag),
                      ),
                      SizedBox(width: 22.w),
                      SvgPicture.asset(MyImages.icon_flag),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        var newTodo = TodoModel(
                          title: newTitle,
                          description: newDescription,
                          date: "date",
                          priority: "priority",
                          isCompleted: 0,
                        );
                        LocalDatabase.insertToDatabase(newTodo);

                        widget.onNewTask();

                        Navigator.pop(context);
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
