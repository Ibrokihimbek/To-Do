import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../utils/colors.dart';

Widget DividerWidget() {
  return const Divider(
    thickness: 1,
    color: MyColors.C_979797,
  );
}

Widget DividerOrDivider() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 5).r,
        child: SizedBox(
          width: 154.w,
          child: DividerWidget(),
        ),
      ),
      SizedBox(width: 2.w),
      Text(
        textAlign: TextAlign.center,
        'or',
        style: FontLatoW400(color: MyColors.C_979797),
      ),
      SizedBox(width: 2.w),
      Padding(
        padding: const EdgeInsets.only(top: 5).r,
        child: SizedBox(
          width: 154.w,
          child: DividerWidget(),
        ),
      ),
    ],
  );
}
