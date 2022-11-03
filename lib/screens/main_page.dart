import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/add_task_widget.dart';
import 'package:note/widgets/texfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo_model.dart';
import '../utils/app_routes.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_style_widget.dart';
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
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _pages[_selectedIndex],
      backgroundColor: MyColors.C_121212,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: SvgPicture.asset(MyImages.icon_more),
        ),
        backgroundColor: MyColors.C_121212,
        elevation: 0,
        title: const Text("Index"),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(MyImages.image_person),
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      drawer: Drawer(
        backgroundColor: MyColors.C_363636,
        child: InkWell(
          onTap: () {
            saveLogin(context);
          },
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
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
                if (_selectedIndex == 2) {
                  showDatePicker(
                    confirmText: 'Choose Time',
                    cancelText: 'Cancel',
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2101),
                  );
                }
              },
            );
          },
          iconSize: 28,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.50),
          backgroundColor: MyColors.C_363636,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(MyImages.icon_home),
              label: 'Index',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                MyImages.icon_add,
                width: 54,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(MyImages.icon_calendar),
              label: 'Calendar',
            ),
          ],
        ),
      ),
    );
  }

  void saveLogin(context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", false);

    Navigator.pushReplacementNamed(context, RoutName.onBoarding);
  }
}
