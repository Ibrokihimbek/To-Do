import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_121212,
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Padding(
                padding: const EdgeInsets.only(left: 48).r,
                child: Column(
                  children: [
                    SizedBox(height: 75.h),
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
    );
  }
}
