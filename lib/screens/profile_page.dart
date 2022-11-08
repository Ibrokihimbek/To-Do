import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/local_data/theme_provider.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/change_name_widget.dart';
import 'package:note/widgets/settings_widget.dart';
import 'package:note/widgets/text_style_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local_data/storage_repository.dart';
import '../utils/app_routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String name = StorageRepository.getStringt('name');

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile'.tr(),
          style: FontLatoW400(
            color: isDark
                ? MyColors.C_FFFFFF.withOpacity(0.87)
                : MyColors.C_121212.withOpacity(0.87),
          ).copyWith(fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).r,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const CircleAvatar(
                  radius: 42.5,
                  backgroundImage: AssetImage(MyImages.image_profile),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                name,
                style: FontLatoW500(
                  color: isDark
                      ? MyColors.C_FFFFFF.withOpacity(0.87)
                      : MyColors.C_121212.withOpacity(0.87),
                ).copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 154.w,
                    height: 58.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
                    ),
                    // child: Text('${}'),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 154.w,
                    height: 58.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: isDark ? MyColors.C_363636 : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              profileMenu(
                menuName: 'Settings'.tr(),
                iconSettings: MyImages.icon_settings,
                settingsName: 'App Settings'.tr(),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return SettingsWidget();
                    },
                  );
                },
              ),
              SizedBox(height: 16.h),
              profileMenu(
                menuName: 'Account'.tr(),
                iconSettings: MyImages.icon_profile,
                settingsName: 'Change account name'.tr(),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeNameWidget(
                        newName: (controller) {
                          StorageRepository.setString('name', controller.text);
                          setState(() {});
                        },
                      );
                    },
                  );
                },
              ),
              profileMenu(
                menuName: null,
                iconSettings: MyImages.icon_key,
                settingsName: 'Change account password'.tr(),
                onTap: () {},
              ),
              profileMenu(
                menuName: null,
                iconSettings: MyImages.icon_camera,
                settingsName: 'Change account Image'.tr(),
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              profileMenu(
                menuName: 'Uptodo',
                iconSettings: MyImages.icon_info,
                settingsName: 'FAQ'.tr(),
                onTap: () {},
              ),
              profileMenu(
                menuName: null,
                iconSettings: MyImages.icon_flash,
                settingsName: 'Help & Feedback'.tr(),
                onTap: () {},
              ),
              profileMenu(
                menuName: null,
                iconSettings: MyImages.icon_like,
                settingsName: 'Support US'.tr(),
                onTap: () {},
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      saveLogin(context);
                    },
                    child: SizedBox(
                      height: 48.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(MyImages.icon_logOut),
                          SizedBox(width: 10.w),
                          Text(
                            'Log out'.tr(),
                            style: FontLatoW400(
                              color: MyColors.C_FF4949,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileMenu(
      {String? menuName,
      required String iconSettings,
      required String settingsName,
      required VoidCallback onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        menuName == null
            ? const SizedBox()
            : Text(
                menuName,
                style: FontLatoW400(
                  color: isDark ? MyColors.C_AFAFAF : Colors.black87,
                ).copyWith(fontSize: 14.sp),
              ),
        SizedBox(height: menuName == '' ? 0 : 4.h),
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 48.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      iconSettings,
                      color: isDark
                          ? MyColors.C_FFFFFF.withOpacity(0.87)
                          : MyColors.C_121212.withOpacity(0.87),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      settingsName,
                      style: FontLatoW400(
                        color: isDark
                            ? MyColors.C_FFFFFF.withOpacity(0.87)
                            : MyColors.C_121212.withOpacity(0.87),
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  MyImages.icon_arroeLeft,
                  color: isDark
                      ? MyColors.C_FFFFFF.withOpacity(0.87)
                      : MyColors.C_121212.withOpacity(0.87),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void saveLogin(context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", false);

    Navigator.pushReplacementNamed(context, RoutName.onBoarding);
  }
}
