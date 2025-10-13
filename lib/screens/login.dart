import 'package:flutter/material.dart';
import 'package:untitled2/screens/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController pasController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            children: [
              Text("Welcome",
        style: TextStyle(color: Colors.blue , fontSize: 25),

        ),
        SizedBox(height: 50,),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
           label: Text("Email"),
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
           
           ),
           icon: Icon(Icons.email)
          ),
          
        ),
              SizedBox(height: 50,),


              TextField(
                controller: pasController,
                obscureText: true,
                decoration: InputDecoration(

                    label: Text("Password"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),

                    ),
                    icon: Icon(Icons.password)
                ),

              ),
              SizedBox(height: 50,),

ElevatedButton(onPressed: (){
}, child: Text("Login")),
              SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp(),));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp(),));


                  }, child: Text("Signup")),
                ],
              )
          ],
        ),


        ),

      ),


    );
  }
}
