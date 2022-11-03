import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../database/local_database.dart';
import '../models/todo_model.dart';
import '../utils/time_utils.dart';

class TaskItem extends StatelessWidget {
  TodoModel? model;
  VoidCallback onDeleted;
  VoidCallback onSelected;

  TaskItem({
    Key? key,
    required this.model,
    required this.onDeleted,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      behavior: HitTestBehavior.deferToChild,
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 12).r,
        color: MyColors.C_8687E7,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 32,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Delete"),
                content: Text(
                  "Are you sure to delete task ${model?.title}",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onDeleted();
                    },
                    child: const Text("NO"),
                  ),
                  TextButton(
                    onPressed: () async {
                      var res = await LocalDatabase.deleteTaskById(model!.id!);

                      if (res != 0) {
                        Navigator.pop(context);
                        onDeleted();
                      }
                    },
                    child: const Text("YES"),
                  ),
                ],
              );
            },
          );
        }
      },
      child: InkWell(
        onTap: onSelected,
        child: Container(
          padding: const EdgeInsets.all(14).r,
          margin: const EdgeInsets.symmetric(vertical: 12).r,
          color: MyColors.C_363636,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Text(
                model?.title.toString() ?? "No title",
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    model?.description.toString().substring(
                              0,
                              !model!.isTitleExpanded
                                  ? (model!.description.length > 30
                                      ? 30
                                      : model!.description.length)
                                  : model!.description.length,
                            ) ??
                        "No desc",
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutName.description,
                          arguments: {'toDoModel': model});
                    },
                    child: Text(
                      !model!.isTitleExpanded
                          ? (model!.description.length > 30 ? "... more" : "")
                          : "\nshow less",
                      style: FontLatoW400(
                        color: MyColors.C_FFFFFF.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                TimeUtils.formatToMyTime(
                  DateTime.parse(model!.date),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
