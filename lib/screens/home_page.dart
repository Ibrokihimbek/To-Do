import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/task_shimmer_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../database/local_database.dart';
import '../models/todo_model.dart';
import '../widgets/task_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? MyColors.C_121212 : MyColors.C_FFFFFF,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            MyImages.icon_more,
            color: isDark
                ? MyColors.C_FFFFFF.withOpacity(0.87)
                : MyColors.C_121212.withOpacity(0.87),
          ),
        ),
        backgroundColor: isDark ? MyColors.C_121212 : MyColors.C_FFFFFF,
        elevation: 0,
        title: Text(
          "Index".tr(),
          style: FontLatoW400(
            color: isDark
                ? MyColors.C_FFFFFF.withOpacity(0.87)
                : MyColors.C_121212.withOpacity(0.87),
          ).copyWith(fontSize: 20.sp),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(MyImages.image_profile),
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (val) {
                  setState(
                    () {
                      search = val;
                    },
                  );
                },
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Search for your task...'.tr(),
                  hintStyle: FontLatoW400(
                      color: isDark ? MyColors.C_AFAFAF : Colors.black54),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(12).r,
                    child: SvgPicture.asset(MyImages.icon_search,
                        color: isDark ? MyColors.C_AFAFAF : Colors.black54),
                  ),
                  filled: true,
                  fillColor: isDark ? MyColors.C_1D1D1D : Colors.grey.shade300,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            unCompletedTodos(),
            completedTodos(),
          ],
        ),
      ),
    );
  }

  Widget unCompletedTodos() {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        'Uncompleted'.tr(),
        style: FontLatoW400(
          color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212,
        ),
      ),
      children: [
        SingleChildScrollView(
          child: FutureBuilder(
            future: LocalDatabase.getTodosIsCompleted(0, title: search),
            builder: (BuildContext context,
                AsyncSnapshot<List<TodoModel>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20).r,
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        SvgPicture.asset(MyImages.icon_checklist),
                        Text(
                          'What do you want to do today?'.tr(),
                          style: FontLatoW400(
                            color: isDark
                                ? MyColors.C_FFFFFF.withOpacity(0.87)
                                : MyColors.C_121212.withOpacity(0.87),
                          ).copyWith(fontSize: 20.sp),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          textAlign: TextAlign.center,
                          'Tap + to add your tasks'.tr(),
                          style: FontLatoW400(
                            color: isDark
                                ? MyColors.C_FFFFFF.withOpacity(0.87)
                                : MyColors.C_121212.withOpacity(0.87),
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      onCompleted: (todo) {
                        setState(() {
                          LocalDatabase.updateTaskById(
                            todo.copyWith(isCompleted: 1),
                          );
                        });
                      },
                      model: snapshot.data?[index],
                      onDeleted: () {
                        setState(() {});
                      },
                      onSelected: () {
                        Navigator.pushNamed(
                          context,
                          RoutName.updateWidget,
                          arguments: {
                            'toDoModel': snapshot.data![index],
                            'onDeleted': () {
                              setState(() {});
                            }
                          },
                        );
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: FontLatoW400(
                      color: isDark ? MyColors.C_FFFFFF : Colors.black,
                    ),
                  ),
                );
              }
              return Center(
                child: Column(
                  children: [
                    taskShimmer(),
                    taskShimmer(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget completedTodos() {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        'Completed'.tr(),
        style: FontLatoW400(
          color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212,
        ),
      ),
      children: [
        SingleChildScrollView(
          child: FutureBuilder(
            future: LocalDatabase.getTodosIsCompleted(1, title: search),
            builder: (BuildContext context,
                AsyncSnapshot<List<TodoModel>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {}
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      onCompleted: (todo) {
                        setState(() {
                          LocalDatabase.updateTaskById(
                            todo.copyWith(isCompleted: 0),
                          );
                        });
                      },
                      model: snapshot.data?[index],
                      onDeleted: () {
                        setState(() {});
                      },
                      onSelected: () {
                        Navigator.pushNamed(
                          context,
                          RoutName.updateWidget,
                          arguments: {
                            'toDoModel': snapshot.data![index],
                            'onDeleted': () {
                              setState(() {});
                            }
                          },
                        );
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: FontLatoW400(
                      color: isDark ? MyColors.C_FFFFFF : Colors.black,
                    ),
                  ),
                );
              }
              return Center(
                child: Column(
                  children: [
                    taskShimmer(),
                    taskShimmer(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
