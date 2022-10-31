import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/colors.dart';
import 'package:note/widgets/button_widget.dart';

import '../utils/images.dart';
import '../widgets/divider_widget.dart';
import '../widgets/texfield_widget.dart';
import '../widgets/text_style_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_121212,
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
                    context: context,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RoutName.logIn);
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Register',
                    style: FontLatoW700(),
                  ),
                  SizedBox(height: 23.h),
                  Text(
                    'Username',
                    style: FontLatoW400(
                      color: MyColors.C_FFFFFF.withOpacity(0.87),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFieldName(hinttext: 'Enter your Username'),
                  SizedBox(height: 25.h),
                  Text(
                    'Password',
                    style: FontLatoW400(
                      color: MyColors.C_FFFFFF.withOpacity(0.87),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFieldPassword(hinttext: '• • • • • • • • • • • •'),
                  SizedBox(height: 25.h),
                  Text(
                    'Confirm Password',
                    style: FontLatoW400(
                      color: MyColors.C_FFFFFF.withOpacity(0.87),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFieldPassword(hinttext: '• • • • • • • • • • • •'),
                  SizedBox(height: 40.h),
                  ButtonConiformation(
                    buttonName: 'Register',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
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
                                color: MyColors.C_363636,
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset(MyImages.icon_fingerprint),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "Please hold your finger at "
                                    "the fingerprint scanner to verify your identity",
                                    textAlign: TextAlign.center,
                                    style: FontLatoW400(
                                      color: Colors.white.withOpacity(0.87),
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
                  SizedBox(height: 18.h),
                  DividerOrDivider(),
                  SizedBox(height: 24.h),
                  ButtonContinueAccount(
                    buttonText: 'Login with Google',
                    icon: MyImages.icon_google,
                    onTap: () {},
                  ),
                  SizedBox(height: 17.h),
                  ButtonContinueAccount(
                    buttonText: 'Login with Appe',
                    icon: MyImages.icon_apple,
                    onTap: () {},
                  ),
                  SizedBox(height: 46.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: FontLatoW400(color: MyColors.C_979797)
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 4.w),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutName.logIn);
                        },
                        child: Text(
                          'Login',
                          style: FontLatoW400(
                            color: MyColors.C_FFFFFF.withOpacity(0.87),
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
