import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/widgets/button_widget.dart';
import 'package:note/widgets/divider_widget.dart';
import 'package:note/widgets/texfield_widget.dart';
import 'package:note/widgets/text_style_widget.dart';

import '../local_data/storage_repository.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isDark = false;

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonBack(
                      color: isDark ? MyColors.C_FFFFFF : MyColors.C_121212,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(height: 41.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Login'.tr(),
                    style: FontLatoW700().copyWith(
                      color: isDark
                          ? MyColors.C_FFFFFF.withOpacity(0.87)
                          : MyColors.C_121212.withOpacity(0.87),
                    ),
                  ),
                  SizedBox(height: 53.h),
                  Text(
                    'Username'.tr(),
                    style: FontLatoW400(
                      color: isDark
                          ? MyColors.C_FFFFFF.withOpacity(0.87)
                          : MyColors.C_121212.withOpacity(0.87),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFieldName(
                      styleColor: isDark ? MyColors.C_FFFFFF : Colors.black,
                      filColor: isDark
                          ? MyColors.C_1D1D1D
                          : const Color.fromARGB(255, 191, 191, 191),
                      focuseColor: isDark ? MyColors.C_979797 : Colors.black54,
                      enabledColor: isDark ? MyColors.C_979797 : Colors.black54,
                      hintColor: isDark ? MyColors.C_AFAFAF : Colors.black54,
                      hinttext: 'Enter your Username'.tr(),
                      textControler: myController),
                  SizedBox(height: 25.h),
                  Text(
                    'Password'.tr(),
                    style: FontLatoW400(
                      color: isDark
                          ? MyColors.C_FFFFFF.withOpacity(0.87)
                          : MyColors.C_121212.withOpacity(0.87),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFieldPassword(
                      styleColor: isDark ? MyColors.C_FFFFFF : Colors.black,
                      filColor: isDark
                          ? MyColors.C_1D1D1D
                          : const Color.fromARGB(255, 191, 191, 191),
                      focuseColor: isDark ? MyColors.C_979797 : Colors.black54,
                      enabledColor: isDark ? MyColors.C_979797 : Colors.black54,
                      hintColor: isDark
                          ? MyColors.C_535353
                          : Color.fromARGB(137, 143, 143, 143),
                      hinttext: '• • • • • • • • • • • •'),
                  SizedBox(height: 64.h),
                  ButtonConiformation(
                    color: isDark ? MyColors.C_FFFFFF : Colors.black,
                    buttonName: 'Login'.tr(),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        StorageRepository.setString('name', myController.text);
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.all(24).r,
                              height: 350.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  topRight: Radius.circular(16.r),
                                ),
                                color: isDark
                                    ? MyColors.C_363636
                                    : Colors.grey[400],
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    MyImages.icon_fingerprint,
                                    color: isDark
                                        ? MyColors.C_FFFFFF.withOpacity(0.87)
                                        : MyColors.C_121212.withOpacity(0.87),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "Please hold your finger at the fingerprint scanner to verify your identity"
                                        .tr(),
                                    textAlign: TextAlign.center,
                                    style: FontLatoW400(
                                      color: isDark
                                          ? MyColors.C_FFFFFF.withOpacity(0.87)
                                          : MyColors.C_121212.withOpacity(0.87),
                                    ).copyWith(fontSize: 20.sp),
                                  ),
                                  SizedBox(height: 48.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ButtonCancel(onTap: () {
                                        Navigator.pop(context);
                                      }),
                                      ButtonUsePassword(
                                        onPressed: () {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              RoutName.main,
                                              (route) => false);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 45.h),
                  DividerOrDivider(),
                  SizedBox(height: 29.h),
                  ButtonContinueAccount(
                    textColor: isDark
                        ? MyColors.C_FFFFFF.withOpacity(0.87)
                        : MyColors.C_121212.withOpacity(0.87),
                    buttonText: 'Login with Google'.tr(),
                    icon: MyImages.icon_google,
                    onTap: () {},
                  ),
                  SizedBox(height: 17.h),
                  ButtonContinueAccount(
                    textColor: isDark
                        ? MyColors.C_FFFFFF.withOpacity(0.87)
                        : MyColors.C_121212.withOpacity(0.87),
                    buttonText: 'Login with Apple'.tr(),
                    icon: MyImages.icon_apple,
                    onTap: () {},
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?'.tr(),
                        style: FontLatoW400(
                                color:
                                    isDark ? MyColors.C_979797 : Colors.black54)
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 4.w),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutName.register);
                        },
                        child: Text(
                          'Register'.tr(),
                          style: FontLatoW400(
                            color: isDark
                                ? MyColors.C_FFFFFF.withOpacity(0.87)
                                : Colors.black.withOpacity(0.87),
                          ).copyWith(fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
