import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/screens/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController pasController = TextEditingController();
  TextEditingController conpassController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
    //  resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [

          IconButton(onPressed: (){
            if(context.locale.languageCode =='ar'){

              context.setLocale(Locale('en'));

            }else{
              context.setLocale(Locale('ar'));

            }

          }, icon: Icon(Icons.language))

        ],
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome".tr(),
                  style: TextStyle(color: Colors.blue , fontSize: 25),
            
                ),
                SizedBox(height: 50,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: Text("Email".tr()),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
            
                      ),
                      icon: Icon(Icons.email)
                  ),
            
                ),
                SizedBox(height: 50,),
            
            
                TextField(
                  controller: nameController,
                  obscureText: true,
                  decoration: InputDecoration(
            
                      label: Text("Password".tr()),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
            
                      ),
                      icon: Icon(Icons.password)
                  ),
            
                ),
                SizedBox(height: 50,),
                TextField(
                  controller: pasController,
                  decoration: InputDecoration(
                      label: Text("Email".tr()),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
            
                      ),
                      icon: Icon(Icons.email)
                  ),
            
                ),
                SizedBox(height: 50,),
            
            
                TextField(
                  controller: conpassController,
                  obscureText: true,
                  decoration: InputDecoration(
            
                      label: Text("Password".tr()),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
            
                      ),
                      icon: Icon(Icons.password)
                  ),
            
                ),
                SizedBox(height: 50,),
            
                ElevatedButton(onPressed: (){
                  print("email : ${emailController.text}");
                  print("pass : ${pasController.text}");
                }, child: Text("Signup".tr())),
                SizedBox(height: 50,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("alrady have an account?"),
                    TextButton(onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
            
            
                    }, child: Text("Login".tr())),
                  ],
                )
              ],
            ),
          ),


        ),

      ),


    );
  }
}
