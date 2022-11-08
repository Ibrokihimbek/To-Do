import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';

import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../models/cotegory_model.dart';

class ButtonMark extends StatefulWidget {
  ValueChanged<int> onSelected;
  Color color;
  ButtonMark({super.key, required this.onSelected, required this.color});

  @override
  State<ButtonMark> createState() => _ButtonMarkState();
}

class _ButtonMarkState extends State<ButtonMark> {
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
                        "Choose Category".tr(),
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3.h,
                        width: MediaQuery.of(context).size.height * 0.7.w,
                        child: GridView.builder(
                            itemCount: CotegoryToDo.cotegories.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              return categoryItem(
                                  CotegoryToDo.cotegories[index], index);
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
        MyImages.icon_tag,
        color: widget.color,
      ),
    );
  }

  Widget categoryItem(CotegoryToDo category, int index) {
    return InkWell(
      onTap: () {
        widget.onSelected(index);
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            color: category.color,
            child: Center(
              child: SvgPicture.asset(category.iconName),
            ),
          ),
          SizedBox(height: 4.h),
          Expanded(
            child: Text(
              category.cotegoryNAme.tr(),
              style: FontLatoW400(
                color: isDark ? MyColors.C_FFFFFF : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
