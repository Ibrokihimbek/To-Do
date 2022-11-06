import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../database/local_database.dart';
import '../models/cotegory_model.dart';
import '../models/cotegory_model.dart';
import '../models/todo_model.dart';
import '../utils/time_utils.dart';

class TaskItem extends StatefulWidget {
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
  State<TaskItem> createState() => _TaskItemState();
}

bool isDark = false;

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Dismissible(
      behavior: HitTestBehavior.deferToChild,
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 12).r,
        color: MyColors.C_8687E7,
        child: Icon(
          Icons.delete,
          color: isDark ? Colors.white : Colors.black,
          size: 32,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Delete".tr()),
                content: Text(
                  "Are you sure to delete task".tr(),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onDeleted();
                    },
                    child: Text("NO".tr()),
                  ),
                  TextButton(
                    onPressed: () async {
                      var res =
                          await LocalDatabase.deleteTaskById(widget.model!.id!);

                      if (res != 0) {
                        Navigator.pop(context);
                        widget.onDeleted();
                      }
                    },
                    child: Text("YES".tr()),
                  ),
                ],
              );
            },
          );
        }
      },
      child: InkWell(
        onTap: widget.onSelected,
        child: Container(
          padding: const EdgeInsets.all(14).r,
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12).r,
          color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Text(
                widget.model?.title.toString() ?? "No title",
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TimeUtils.formatToMyTime(
                      DateTime.parse(widget.model!.date),
                    ),
                    style:
                        TextStyle(color: isDark ? Colors.white : Colors.black),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 29.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: chooseCotegoryColor(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(chooseCotegoryIcon()),
                              widget.model!.categoryId != -1
                                  ? Text(
                                      "${chooseCotegory()}",
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        width: 50.w,
                        height: 29.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: MyColors.C_8875FF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                MyImages.icon_flag,
                                color:
                                    isDark ? MyColors.C_FFFFFF : Colors.black,
                              ),
                              Text(
                                "${widget.model!.priority + 1}",
                                style: FontLatoW400(
                                        color: isDark
                                            ? MyColors.C_FFFFFF
                                            : Colors.black)
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseCotegory() {
    switch (widget.model!.categoryId) {
      case 0:
        return 'Work'.tr();
      case 1:
        return 'Sport'.tr();
      case 2:
        return 'University'.tr();
      case 3:
        return 'Home'.tr();
      case 4:
        return 'Health'.tr();
      case 5:
        return 'Movie'.tr();
      default:
    }
  }

  chooseCotegoryColor() {
    switch (widget.model!.categoryId) {
      case 0:
        return MyColors.C_FF9680;
      case 1:
        return MyColors.C_80FFFF;
      case 2:
        return MyColors.C_8875FF;

      case 3:
        return MyColors.C_FFCC80;

      case 4:
        return MyColors.C_80FFA3;

      case 5:
        return MyColors.C_80D1FF;

      default:
    }
  }

  chooseCotegoryIcon() {
    switch (widget.model!.categoryId) {
      case 0:
        return MyImages.icon_work;
      case 1:
        return MyImages.icon_sport;
      case 2:
        return MyImages.icon_universty;
      case 3:
        return MyImages.icon_house;
      case 4:
        return MyImages.icon_health;
      case 5:
        return MyImages.icon_movie;
      default:
    }
  }
}
