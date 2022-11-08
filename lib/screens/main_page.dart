import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note/screens/profile_page.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/add_task_widget.dart';
import 'package:note/widgets/settings_widget.dart';


import 'home_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();

  int _selectedIndex = 0;
  final formKey = GlobalKey<FormState>();

  List<Widget> _pages = [
    HomePage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      backgroundColor: isDark ? MyColors.C_121212 : MyColors.C_FFFFFF,
      bottomNavigationBar: SizedBox(
        height: 86.h,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(
              () {
                _selectedIndex = index;
                if (_selectedIndex == 1) {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return AddTaskWidget(
                        onNewTask: () {
                          setState(
                            () {
                              _selectedIndex = 0;
                            },
                          );
                        },
                      );
                    },
                  );
                }
              },
            );
          },
          iconSize: 28,
          selectedItemColor: isDark ? Colors.white : Colors.black,
          unselectedItemColor: isDark
              ? Colors.white.withOpacity(0.50)
              : Colors.black.withOpacity(0.50),
          backgroundColor: isDark ? MyColors.C_363636 : Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                MyImages.icon_home,
                color: isDark ? Colors.white : Colors.black87,
              ),
              label: 'Index'.tr(),
            ),
            BottomNavigationBarItem(
              icon: addButton(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                MyImages.icon_profile,
                color: isDark ? Colors.white : Colors.black87,
              ),
              label: 'Profile'.tr(),
            ),
          ],
        ),
      ),
    );
  }

  Container addButton() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: MyColors.C_8687E7,
      ),
      width: 54.w,
      height: 54.h,
      child: Center(
        child: Text(
          '+',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 28.sp,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
