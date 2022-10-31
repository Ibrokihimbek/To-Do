import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
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
      backgroundColor: MyColors.C_121212,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonBack(
                context: context,
                onTap: () {
                  Navigator.pop(context);
                }),
            SizedBox(height: 58.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Welcome to UpTodo',
                style: FontLatoW700(),
              ),
            ),
            SizedBox(height: 26.h),
            Text(
              textAlign: TextAlign.center,
              'Please login to your account or create new account to continue',
              style: FontLatoW400(
                color: MyColors.C_FFFFFF.withOpacity(0.67),
              ),
            ),
            SizedBox(height: 370.h),
            ButtonLoginOrCreate(
                buttonName: 'LOGIN',
                onTap: () {
                  Navigator.pushNamed(context, RoutName.logIn);
                }),
            SizedBox(height: 28.h),
            ButtonLoginOrCreate(
                buttonName: 'CREATE ACCOUNT',
                onTap: () {
                  Navigator.pushNamed(context, RoutName.register);
                }),
          ],
        ),
      ),
    );
  }
}
