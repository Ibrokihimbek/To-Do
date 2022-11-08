import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';

import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

class ButtonFlag extends StatefulWidget {
  ValueChanged<int> onSelected;
  Color color;
  ButtonFlag({super.key, required this.onSelected, required this.color});

  @override
  State<ButtonFlag> createState() => _ButtonFlagState();
}

class _ButtonFlagState extends State<ButtonFlag> {
  int value = 0;
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
                  backgroundColor:
                      isDark ? MyColors.C_363636 : Colors.grey.shade400,
                  title: Column(
                    children: [
                      Text(
                        "Task Priority".tr(),
                        style: FontLatoW700().copyWith(
                          fontSize: 16.sp,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Divider(
                        thickness: 2,
                        color: isDark ? MyColors.C_AFAFAF : Colors.black54,
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.23.h,
                        width: MediaQuery.of(context).size.height * 0.7.w,
                        child: GridView.builder(
                            itemCount: 10,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              crossAxisCount: 4,
                            ),
                            itemBuilder: (context, index) {
                              return categoryItem(index);
                            }),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: SvgPicture.asset(
        MyImages.icon_flag,
        color: widget.color,
      ),
    );
  }

  Widget categoryItem(int index) {
    return InkWell(
      onTap: () {
        widget.onSelected(index);

        Navigator.pop(context);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: isDark ? const Color(0xff272727) : Colors.grey[600],
            ),
            height: 68,
            width: 68,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      MyImages.icon_flag,
                      color: isDark ? MyColors.C_FFFFFF : Colors.black,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "${index + 1}",
                      style: FontLatoW400(
                        color: isDark ? MyColors.C_FFFFFF : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
