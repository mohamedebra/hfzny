import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/core/routes/app_router.dart';
import 'package:untitled2/core/routes/routes.dart';
import 'package:untitled2/core/style/color.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 810),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', ''), // Arabic
          const Locale('en', ''), // English
          // Add other locales your app supports
        ],
        locale: const Locale('ar', ''),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: ColorsManager.mainMauve),
        // home: RegisterScreen(),
        title: 'Hfzny',
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
