import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/screens/welcome_page.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/post_indicator_widget.dart';
import 'package:note/widgets/text_style_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/onboarding_model.dart';
import '../utils/app_routes.dart';

class OnboardinPage extends StatefulWidget {
  const OnboardinPage({super.key});

  @override
  State<OnboardinPage> createState() => _OnboardinPageState();
}

int currentIndex = 0;
PageController pageController = PageController();
String NextButton = 'Next'.tr();
bool isDark = false;

class _OnboardinPageState extends State<OnboardinPage> {
  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.h),
            Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: InkWell(
                onTap: () {
                  saveLogin(context);
                },
                child: Text(
                  'Skip'.tr(),
                  style: FontLatoW400(
                    color: isDark
                        ? MyColors.C_FFFFFF.withOpacity(0.44)
                        : Colors.black.withOpacity(0.44),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: 330.sp,
                  left: 140.sp,
                  child: Center(
                    child: Container(
                      child: PostIndicatorWidget(
                          color: isDark
                              ? MyColors.C_FFFFFF.withOpacity(0.87)
                              : Colors.black.withOpacity(0.87),
                          currentIndex: currentIndex),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 600.h,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                        if (currentIndex == 2) {
                          NextButton = 'Get started'.tr();
                        } else {
                          NextButton = 'Next'.tr();
                        }
                      });
                    },
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    itemCount: OnboardingModel.onboard.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OnboardItem(OnboardingModel.onboard[index]);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 70.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          pageController.previousPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease);
                        },
                      );
                    },
                    child: Text(
                      'Back'.tr(),
                      style: FontLatoW400(
                        color: isDark
                            ? MyColors.C_FFFFFF.withOpacity(0.44)
                            : Colors.black.withOpacity(0.44),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (currentIndex == 1) {
                        NextButton = 'Get started'.tr();
                      }
                      setState(() {
                        if (currentIndex == 2) {
                          saveLogin(context);
                        }

                        pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      });
                    },
                    child: Container(
                      width: NextButton == 'Next'.tr() ? 100.w : 150.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: MyColors.C_8875FF),
                      child: Center(
                        child: Text(
                          NextButton,
                          style: FontLatoW400(
                              color: isDark ? MyColors.C_FFFFFF : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget OnboardItem(OnboardingModel onboard) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Image.asset(
          onboard.imageName,
          width: onboard.imageName == MyImages.image_onboarding_1 ? 213 : 270,
        ),
        SizedBox(height: 100.h),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              onboard.title.tr(),
              style: FontLatoW700().copyWith(
                color: isDark
                    ? MyColors.C_FFFFFF.withOpacity(0.87)
                    : Colors.black.withOpacity(0.87),
              ),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                onboard.subTitle.tr(),
                style: FontLatoW400(
                  color: isDark
                      ? MyColors.C_FFFFFF.withOpacity(0.87)
                      : Colors.black.withOpacity(0.87),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void saveLogin(context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", true);

    Navigator.pushReplacementNamed(context, RoutName.welcome);
  }
}
