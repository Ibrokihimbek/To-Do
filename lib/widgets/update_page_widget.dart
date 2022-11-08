import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/models/todo_model.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/button_widget.dart';
import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../database/local_database.dart';
import '../utils/app_routes.dart';
import 'update_task_widget.dart';

class UpdateWidget extends StatefulWidget {
  TodoModel? todo;
  VoidCallback onDeleted;

  UpdateWidget({super.key, required this.todo, required this.onDeleted});

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? MyColors.C_121212 : MyColors.C_FFFFFF,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).r,
          child: Column(
            children: [
              SizedBox(height: 73.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: isDark
                                  ? MyColors.C_FFFFFF
                                  : MyColors.C_121212,
                              width: 2.w),
                        ),
                      ),
                      SizedBox(width: 21.w),
                      Text(
                        widget.todo!.title,
                        style: FontLatoW400(
                          color: isDark
                              ? MyColors.C_FFFFFF.withOpacity(0.87)
                              : MyColors.C_121212.withOpacity(0.87),
                        ).copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    MyImages.icon_edit,
                    color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.only(left: 40).r,
                child: Row(
                  children: [
                    Text(
                      widget.todo?.description.toString().substring(
                                0,
                                !widget.todo!.isTitleExpanded
                                    ? (widget.todo!.description.length > 30
                                        ? 30
                                        : widget.todo!.description.length)
                                    : widget.todo!.description.length,
                              ) ??
                          "No desc",
                      style: TextStyle(
                        color: isDark
                            ? MyColors.C_FFFFFF.withOpacity(0.5)
                            : Colors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutName.description,
                            arguments: {'toDoModel': widget.todo});
                      },
                      child: Text(
                        !widget.todo!.isTitleExpanded
                            ? (widget.todo!.description.length > 20
                                ? "... more".tr()
                                : "")
                            : "\nshow less".tr(),
                        style: FontLatoW400(
                          color: isDark
                              ? MyColors.C_FFFFFF.withOpacity(0.5)
                              : Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 64.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        MyImages.icon_timer,
                        color: isDark ? MyColors.C_FFFFFF : Colors.black,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Task Time :'.tr(),
                        style: FontLatoW400(
                          color: isDark
                              ? MyColors.C_FFFFFF.withOpacity(0.87)
                              : MyColors.C_121212.withOpacity(0.87),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 37.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          widget.todo!.date,
                          style: FontLatoW400(
                            color: isDark
                                ? MyColors.C_FFFFFF.withOpacity(0.87)
                                : MyColors.C_121212.withOpacity(0.87),
                          ).copyWith(fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        MyImages.icon_tag,
                        color: isDark ? MyColors.C_FFFFFF : Colors.black,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Task Category :'.tr(),
                        style: FontLatoW400(
                          color: isDark
                              ? MyColors.C_FFFFFF.withOpacity(0.87)
                              : MyColors.C_121212.withOpacity(0.87),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 37.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(chooseCotegoryIcon()),
                          widget.todo!.categoryId != -1
                              ? Text(
                                  "${chooseCotegory()}",
                                  style: FontLatoW400(
                                    color: isDark
                                        ? MyColors.C_FFFFFF.withOpacity(0.87)
                                        : MyColors.C_121212.withOpacity(0.87),
                                  ).copyWith(fontSize: 12.sp),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        MyImages.icon_flag,
                        color: isDark ? MyColors.C_FFFFFF : Colors.black,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Task Priority :'.tr(),
                        style: FontLatoW400(
                          color: isDark
                              ? MyColors.C_FFFFFF.withOpacity(0.87)
                              : MyColors.C_121212.withOpacity(0.87),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 37.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              MyImages.icon_flag,
                              color: isDark
                                  ? MyColors.C_FFFFFF
                                  : MyColors.C_121212,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              ('${widget.todo!.priority + 1}').toString(),
                              style: FontLatoW400(
                                color: isDark
                                    ? MyColors.C_FFFFFF.withOpacity(0.87)
                                    : MyColors.C_121212.withOpacity(0.87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              InkWell(
                onTap: () {
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
                              var res = await LocalDatabase.deleteTaskById(
                                  widget.todo!.id!);

                              if (res != 0) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RoutName.main, (route) => false);
                                widget.onDeleted();
                              }
                            },
                            child: Text("YES".tr()),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SizedBox(
                  height: 48.h,
                  child: Row(
                    children: [
                      SvgPicture.asset(MyImages.icon_delete),
                      SizedBox(width: 10.w),
                      Text(
                        'Delete Task'.tr(),
                        style: FontLatoW400(
                          color: MyColors.C_FF4949,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 218.h),
              ButtonConiformation(
                buttonName: 'Edit Task'.tr(),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return UpdateTaskWidget(
                        todo: widget.todo!,
                        onUpdatedTask: () {
                          setState(() {});
                        },
                      );
                    },
                  );
                },
                color: isDark
                    ? MyColors.C_FFFFFF.withOpacity(0.87)
                    : MyColors.C_121212.withOpacity(0.87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseCotegory() {
    switch (widget.todo!.categoryId) {
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

  chooseCotegoryIcon() {
    switch (widget.todo!.categoryId) {
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
