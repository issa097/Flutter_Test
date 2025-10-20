import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http show post;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import 'package:untitled2/core/const/svg_const.dart' show SvgConst;
import 'package:untitled2/screens/home_screen.dart';
import 'package:untitled2/screens/sign_up.dart';

import '../core/utils/shared_preferences_helper.dart' show SharedPreferencesHelper;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController pasController = TextEditingController();
  var isloding = false;
  bool isRem = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(SvgConst.flutter_svg),
        //Text("Login".tr()),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'ar') {
                context.setLocale(Locale('en'));
              } else {
                context.setLocale(Locale('ar'));
              }
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                "Welcome".tr(),
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
              SizedBox(height: 55),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text("Email".tr()),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 55),

              TextField(
                controller: pasController,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  icon: Icon(Icons.password),
                ),
              ),

              SizedBox(height: 50),

              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isRem,
                    onChanged: (bool? value) {
                      setState(() {
                        isRem = value!;
                      });
                      print("isa rem me ? $isRem");
                    },
                  ),
                  Text("rem"),
                ],
              ),

              ElevatedButton(
                onPressed: () async {
                  login(Username: emailController.text, Password: pasController.text);
                },
                child: Text("Login".tr()),
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp(),));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text("Signup"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }




  login ({required String Username , required String Password})async{

    isloding = true;
    setState((){});
    final res = await http.post(
      Uri.parse("http://10.0.2.2:5027/api/Users/login"),
      body: jsonEncode({"username": Username, "password": Password}),
      headers: {"Content-Type":"application/json"},

    );
isloding = false;
setState(() {

});
print(res.body);
print(res.statusCode);
    print(res);
    print(Password);
    print(Username);

    if (res.statusCode == 200) {
      var jsonBody = jsonDecode(res.body);

      String accessToken = jsonBody["token"];
      await SharedPreferencesHelper.saveString("accessToken", accessToken);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    }
}


