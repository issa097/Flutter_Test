import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/screens/drawar_screen.dart';
import 'package:untitled2/screens/home_screen.dart';
import 'package:untitled2/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    goTo();
  }

  Future<void> goTo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isRe = prefs.getBool('isRem');

    // ممكن نضيف delay بسيطة لو بدك splash يظهر ثانيتين مثلاً
    await Future.delayed(const Duration(seconds: 2));

    if (isRe == true) {
      // المستخدم مفعّل تذكّرني
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // أول مرة أو تذكّرني مش مفعّل
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
       child: CircularProgressIndicator(),
      ),
    );
  }
}
