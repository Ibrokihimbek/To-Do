import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../database/local_database.dart';
import '../models/todo_model.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/update_task_widget.dart';

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
      backgroundColor: MyColors.C_121212,
      body: Column(
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
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for your task...',
                hintStyle: FontLatoW400(color: MyColors.C_AFAFAF),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12).r,
                  child: SvgPicture.asset(MyImages.icon_search),
                ),
                filled: true,
                fillColor: MyColors.C_1D1D1D,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: LocalDatabase.getTaskByTitle(title: search),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TodoModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20).r,
                      child: Column(
                        children: [
                          SizedBox(height: 60.h),
                          SvgPicture.asset(MyImages.icon_checklist),
                          Text(
                            'What do you want to do today?',
                            style: FontLatoW400(
                              color: MyColors.C_FFFFFF.withOpacity(0.87),
                            ).copyWith(fontSize: 20.sp),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Tap + to add your tasks',
                            style: FontLatoW400(
                              color: MyColors.C_FFFFFF.withOpacity(0.87),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        model: snapshot.data?[index],
                        onDeleted: () {
                          setState(() {});
                        },
                        onSelected: () {
                          showModalBottomSheet(
                            backgroundColor: MyColors.C_363636,
                            context: context,
                            builder: (context) {
                              return UpdateTaskWidget(
                                todo: snapshot.data![index],
                                onUpdatedTask: () {
                                  setState(() {});
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
