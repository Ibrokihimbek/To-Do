import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLog = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isLog = _pref.getBool("isLoggedIn") ?? false;
    return _pref.getBool("isLoggedIn") ?? false;
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn();
    goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacementNamed(
            context, isLog ? RoutName.main : RoutName.onBoarding);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.C_121212,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SizedBox(
            width: 140.w,
            height: 180.h,
            child: SvgPicture.asset(MyImages.icon_logo),
          ),
        ),
      ),
    );
  }
}
