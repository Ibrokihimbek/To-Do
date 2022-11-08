import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../widgets/button_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? MyColors.C_121212 : MyColors.C_FFFFFF,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 58.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Welcome to UpTodo'.tr(),
                style: FontLatoW700().copyWith(
                  color: isDark
                      ? MyColors.C_FFFFFF.withOpacity(0.87)
                      : MyColors.C_121212.withOpacity(0.87),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text(
              textAlign: TextAlign.center,
              'Please login to your account or create new account to continue'
                  .tr(),
              style: FontLatoW400(
                color: isDark
                    ? MyColors.C_FFFFFF.withOpacity(0.67)
                    : MyColors.C_121212.withOpacity(0.67),
              ),
            ),
            SizedBox(height: 370.h),
            buttonColoredAndColorless(
                color: isDark ? MyColors.C_FFFFFF : Colors.black,
                buttonName: 'LOGIN'.tr(),
                onTap: () {
                  Navigator.pushNamed(context, RoutName.logIn);
                }),
            SizedBox(height: 28.h),
            buttonColoredAndColorless(
                color: isDark ? MyColors.C_FFFFFF : Colors.black,
                buttonName: 'CREATE ACCOUNT'.tr(),
                onTap: () {
                  Navigator.pushNamed(context, RoutName.register);
                }),
          ],
        ),
      ),
    );
  }
}
