import 'package:easy_localization/easy_localization.dart' show EasyLocalization, BuildContextEasyLocalizationExtension;
import 'package:flutter/material.dart';
import 'package:untitled2/screens/firsts_screen.dart';
import 'package:untitled2/screens/home_screen.dart';
import 'package:untitled2/screens/splash.dart' show Splash;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  
  runApp( EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

       debugShowCheckedModeBanner: false ,//  عشان اشيل كلمه debug
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),



      home: Splash()
    );
  }
}


