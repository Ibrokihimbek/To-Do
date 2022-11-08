import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/text_style_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        color: isDark ? MyColors.C_121212 : MyColors.C_FFFFFF,
        child: Center(
          child: SizedBox(
            width: 160.w,
            height: 180.h,
            child: Column(
              children: [
                SvgPicture.asset(MyImages.icon_logo),
                Text(
                  'UpTodo',
                  style: FontLatoW700().copyWith(
                      fontSize: 40.sp,
                      color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
