import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/widgets/button_widget.dart';
import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../utils/colors.dart';

class ChangeNameWidget extends StatefulWidget {
  ValueChanged<TextEditingController> newName;
  ChangeNameWidget({super.key, required this.newName});

  @override
  State<ChangeNameWidget> createState() => _ChangeNameWidgetState();
}

class _ChangeNameWidgetState extends State<ChangeNameWidget> {
  final formKey = GlobalKey<FormState>();
  final cantrollerEditName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(24).r,
        height: 340.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Change account name'.tr(),
                style: FontLatoW700().copyWith(
                    fontSize: 16.sp,
                    color: isDark ? MyColors.C_FFFFFF : Colors.black),
              ),
              SizedBox(height: 10.h),
              Divider(
                thickness: 1,
                color: isDark ? MyColors.C_AFAFAF : Colors.black54,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: cantrollerEditName,
                textInputAction: TextInputAction.done,
                style:
                    TextStyle(color: isDark ? MyColors.C_FFFFFF : Colors.black),
                decoration: InputDecoration(
                  counterStyle: TextStyle(
                      color: isDark ? MyColors.C_FFFFFF : Colors.black),
                  hintText: 'New name'.tr(),
                  hintStyle: FontLatoW400(
                    color: isDark ? MyColors.C_979797 : Colors.black54,
                  ),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDark ? MyColors.C_979797 : Colors.black54,
                        width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDark ? MyColors.C_979797 : Colors.black54,
                        width: 0.8),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 28.h),
              ButtonConiformation(
                color: isDark ? MyColors.C_FFFFFF : Colors.black,
                buttonName: 'Edit'.tr(),
                onTap: () {
                  widget.newName(cantrollerEditName);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 10.h),
              buttonColoredAndColorless(
                  color: isDark ? MyColors.C_FFFFFF : Colors.black,
                  buttonName: 'Cancel'.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
