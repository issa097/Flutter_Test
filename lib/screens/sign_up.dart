import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show post;
import 'package:untitled2/core/const/api_body.dart' show ApiBody;
import 'package:untitled2/core/const/api_const.dart' show ApiConst;
import 'package:untitled2/screens/login.dart';

import '../core/utils/shared_preferences_helper.dart'
    show SharedPreferencesHelper;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController pasController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  var isloding = false;

  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Login"),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Welcome".tr(),
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
                SizedBox(height: 50),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("Email".tr()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 50),

                TextField(
                  controller: pasController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Password".tr()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.password),
                  ),
                ),
                SizedBox(height: 50),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    label: Text("Phone".tr()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 50),

                TextField(
                  controller: usernameController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Username".tr()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    icon: Icon(Icons.password),
                  ),
                ),
                SizedBox(height: 50),

                ElevatedButton(
                  onPressed: () {
                    sginup(
                      name: nameController.text,
                      Password: pasController.text,
                      phone: phoneController.text,
                      username: usernameController.text,
                    );
                  },
                  child: Text("Signup".tr()),
                ),
                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("alrady have an account?"),
                    TextButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text("Login".tr()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sginup({
    required String name,
    required String Password,
    required String phone,
    required String username,
  }) async {
    isloding = true;
    setState(() {});
    final res = await http.post(
      Uri.parse(ApiConst.Reg_URL),
      body: jsonEncode({
        ApiBody.Name: name,
        ApiBody.Password2: Password,
        ApiBody.Phone: phone,
        ApiBody.Username2: username,
      }),
      headers: {"Content-Type": "application/json"},
    );
    isloding = false;
    setState(() {});
    print(res.body);
    print(res.statusCode);
    print(res);
    print(Password);

    if (res.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
