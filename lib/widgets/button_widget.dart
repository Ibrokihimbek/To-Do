import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/utils/colors.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../utils/images.dart';

Widget ButtonContinueAccount({
  required String buttonText,
  required String icon,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: MyColors.C_8875FF),
      ),
      width: 327.w,
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 10.w),
          Text(
            buttonText,
            style: FontLatoW400(color: MyColors.C_FFFFFF.withOpacity(0.87)),
          ),
        ],
      ),
    ),
  );
}

Widget ButtonBack({
  required BuildContext context,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 16).r,
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        child: SvgPicture.asset(
          MyImages.icon_back,
          width: 24.w,
          height: 24.h,
        ),
      ),
    ),
  );
}

Widget ButtonLoginOrCreate({
  required String buttonName,
  required VoidCallback onTap,
}) {
  return Center(
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: MyColors.C_8875FF, width: 1),
          color: buttonName == 'LOGIN' ? MyColors.C_8875FF : null,
        ),
        child: Center(
          child:
              Text(buttonName, style: FontLatoW400(color: MyColors.C_FFFFFF)),
        ),
      ),
    ),
  );
}

Widget ButtonConiformation({
  required String buttonName,
  required VoidCallback onTap,
}) {
  return Center(
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: MyColors.C_8875FF,
        ),
        child: Center(
          child: Text(
            buttonName,
            style: FontLatoW400(color: MyColors.C_FFFFFF),
          ),
        ),
      ),
    ),
  );
}

Widget ButtonUsePassword({required VoidCallback onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(150.sp, 48.sp),
      backgroundColor: MyColors.C_8687E7,
    ),
    onPressed: onPressed,
    child: Text(
      "Use Password",
      style: FontLatoW400(color: MyColors.C_FFFFFF),
    ),
  );
}

Widget ButtonCancel({required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 100.w,
      height: 20.h,
      child: Center(
        child: Text(
          "Cancel",
          style: FontLatoW400(color: MyColors.C_8875FF),
        ),
      ),
    ),
  );
}
