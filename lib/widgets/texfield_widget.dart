import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/widgets/text_style_widget.dart';


Widget TextFieldName({
  required String hinttext,
  required textControler,
  required Color styleColor,
  required Color filColor,
  required Color focuseColor,
  required Color enabledColor,
  required Color hintColor,
}) {
  return TextFormField(
    style: TextStyle(color: styleColor),
    controller: textControler,
    validator: (value) {
      if (value == null || value.isEmpty) return 'Please enter your password';
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      fillColor: filColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focuseColor, width: 0.8.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: enabledColor, width: 0.8.w),
      ),
      border: const OutlineInputBorder(),
      hintText: hinttext,
      hintStyle: FontLatoW400(color: hintColor),
    ),
  );
}

Widget TextFieldPassword({
  required String hinttext,
  required Color styleColor,
  required Color filColor,
  required Color focuseColor,
  required Color enabledColor,
  required Color hintColor,
}) {
  return TextFormField(
    style: TextStyle(color: styleColor),
    validator: (value) {
      if (value == null || value.isEmpty) return 'Please enter your Username';
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.text,
    obscureText: true,
    decoration: InputDecoration(
      fillColor: filColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: filColor, width: 0.8.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: enabledColor, width: 0..w),
      ),
      border: const OutlineInputBorder(),
      hintText: hinttext,
      hintStyle: FontLatoW400(color: hintColor),
    ),
  );
}
