import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../utils/colors.dart';
import '../utils/themes.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

int selectedLang = 1;
bool isDark = false;

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;
    switch (context.locale.languageCode) {
      case 'uz':
        selectedLang = 1;
        break;
      case 'en':
        selectedLang = 2;
        break;
      case 'ru':
        selectedLang = 3;
        break;
      default:
    }
    return Container(
      padding: const EdgeInsets.all(24).r,
      height: 340.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Theme'.tr(),
            style: FontLatoW400(
              color: isDark
                  ? MyColors.C_FFFFFF.withOpacity(0.5)
                  : MyColors.C_121212.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.only(left: 26).r,
            child: Row(
              children: [
                Text(
                  'Night mode'.tr(),
                  style:
                      FontLatoW500(color: isDark ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Change the language'.tr(),
            style: FontLatoW400(
              color: isDark
                  ? MyColors.C_FFFFFF.withOpacity(0.5)
                  : MyColors.C_121212.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 12.h),
          RadioListTile(
            title: Text(
              "O'zbekcha",
              style: FontLatoW400(
                color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212,
              ),
            ),
            value: 1,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                () {
                  selectedLang = value as int;
                  context.setLocale(const Locale('uz', 'UZ'));
                },
              );
            }),
          ),
          RadioListTile(
            title: Text(
              "English",
              style: FontLatoW400(
                color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212,
              ),
            ),
            value: 2,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                () {
                  selectedLang = value as int;
                  context.setLocale(const Locale('en', 'US'));
                },
              );
            }),
          ),
          RadioListTile(
            title: Text(
              "Russian",
              style: FontLatoW400(
                color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212,
              ),
            ),
            value: 3,
            groupValue: selectedLang,
            onChanged: ((value) {
              setState(
                () {
                  selectedLang = value as int;
                  context.setLocale(const Locale('ru', 'RU'));
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
