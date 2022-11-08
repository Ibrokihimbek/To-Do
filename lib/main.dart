import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/screens/splash_page.dart';
import 'package:note/utils/app_routes.dart';
import 'package:note/utils/themes.dart';
import 'package:provider/provider.dart';

import 'local_data/storage_repository.dart';
import 'local_data/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  runApp(
    EasyLocalization(
      startLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      child: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: RoutName.splash,
          onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'UpTodo',
          theme: Styles.themeData(
              context.watch<ThemeProvider>().getIsLight(), context),
          themeMode: context.watch<ThemeProvider>().getIsLight()
              ? ThemeMode.dark
              : ThemeMode.light,
          home: child,
        );
      },
      child: const SplashPage(),
    );
  }
}
