import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

TextStyle FontLatoW700() {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        color: MyColors.C_FFFFFF.withOpacity(0.87),
        fontSize: 32.sp),
  );
}

TextStyle FontLatoW400({required Color color}) {
  return GoogleFonts.lato(
    textStyle:
        TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: color),
  );
}
