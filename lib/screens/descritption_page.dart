import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/models/todo_model.dart';
import 'package:note/utils/colors.dart';
import 'package:note/widgets/text_style_widget.dart';

class DescriptionPage extends StatefulWidget {
  TodoModel? model;
  DescriptionPage({super.key, required this.model});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_121212,
      body: SafeArea(
          child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Text(
                widget.model?.title.toString() ?? "No title",
                style: FontLatoW700().copyWith(fontSize: 24.sp),
              ),
              SizedBox(height: 32.h),
              Text(
                widget.model?.description.toString() ?? "No title",
                style: FontLatoW400(color: MyColors.C_FFFFFF),
              ),
            ],
          ),
        ),
      )),
    );
  }
}