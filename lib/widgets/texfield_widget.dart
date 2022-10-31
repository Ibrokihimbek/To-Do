import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../utils/colors.dart';

Widget TextFieldName({required String hinttext}) {
  return TextFormField(
    style: const TextStyle(color: MyColors.C_FFFFFF),
    validator: (value) {
      if (value == null || value.isEmpty) return 'Please enter your password';
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      fillColor: MyColors.C_1D1D1D,
      filled: true,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.C_979797, width: 0.8),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.C_979797, width: 0.8),
      ),
      border: const OutlineInputBorder(),
      hintText: hinttext,
      hintStyle: FontLatoW400(color: MyColors.C_AFAFAF),
    ),
  );
}

Widget TextFieldPassword({required String hinttext}) {
  return TextFormField(
    style: const TextStyle(color: MyColors.C_FFFFFF),
    validator: (value) {
      if (value == null || value.isEmpty) return 'Please enter your Username';
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.text,
    obscureText: true,
    decoration: InputDecoration(
      fillColor: MyColors.C_1D1D1D,
      filled: true,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.C_979797, width: 0.8),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.C_979797, width: 0.8),
      ),
      border: const OutlineInputBorder(),
      hintText: hinttext,
      hintStyle: FontLatoW400(color: MyColors.C_535353),
    ),
  );
}
