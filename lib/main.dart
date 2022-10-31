import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/screens/splash_page.dart';
import 'package:note/utils/app_routes.dart';

import 'local_data/storage_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            initialRoute: RoutName.splash,
            onGenerateRoute: AppRoutes.generateRoute,
            debugShowCheckedModeBanner: false,
            title: 'Note',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: child);
      },
      child: const SplashPage(),
    );
  }
}
