import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

Widget PostIndicatorWidget({required int currentIndex, required Color color}) {
  return Container(
    margin: const EdgeInsets.only(right: 24),
    height: 4.h,
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 4.h,
          width: 26.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(56.r),
            color: currentIndex == index
                ? color
                : MyColors.C_AFAFAF,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 4.w,
        );
      },
    ),
  );
}
