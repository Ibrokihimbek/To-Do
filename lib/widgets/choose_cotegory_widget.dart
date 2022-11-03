import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/button_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

class ButtonMark extends StatelessWidget {
  const ButtonMark({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, state) {
                return AlertDialog(
                  backgroundColor: MyColors.C_363636,
                  title: Column(
                    children: [
                      Text(
                        "Choose Category",
                        style: FontLatoW700().copyWith(fontSize: 16.sp),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        thickness: 2,
                        color: MyColors.C_AFAFAF,
                      ),
                      Row(
                        children: [
                          ctegoryWidget(
                              iconName: MyImages.icon_work,
                              color: MyColors.C_FF9680,
                              cotegory: 'Work'),
                          SizedBox(width: 32.w),
                          ctegoryWidget(
                              iconName: MyImages.icon_sport,
                              color: MyColors.C_80FFFF,
                              cotegory: 'Sport'),
                          SizedBox(width: 32.w),
                          ctegoryWidget(
                              iconName: MyImages.icon_universty,
                              color: MyColors.C_8875FF,
                              cotegory: 'University'),
                        ],
                      ),
                      Row(
                        children: [
                          ctegoryWidget(
                              iconName: MyImages.icon_house,
                              color: MyColors.C_FFCC80,
                              cotegory: 'Home'),
                          SizedBox(width: 32.w),
                          ctegoryWidget(
                              iconName: MyImages.icon_health,
                              color: MyColors.C_80FFA3,
                              cotegory: 'Health'),
                          SizedBox(width: 32.w),
                          ctegoryWidget(
                              iconName: MyImages.icon_movie,
                              color: MyColors.C_80D1FF,
                              cotegory: 'Movie'),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      ButtonConiformation(
                          buttonName: 'Add Category', onTap: () {}),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: SvgPicture.asset(MyImages.icon_tag),
    );
  }

  Widget ctegoryWidget({
    required Color color,
    required String iconName,
    required String cotegory,
  }) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Row(
          children: [
            Container(
              width: 64.w,
              height: 64.h,
              color: color,
              child: Padding(
                padding: const EdgeInsets.all(14).r,
                child: SvgPicture.asset(iconName),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Text(
          cotegory,
          style: FontLatoW400(color: MyColors.C_FFFFFF).copyWith(
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
