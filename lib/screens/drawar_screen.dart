import 'package:flutter/material.dart';
import 'package:untitled2/screens/sign_up.dart' show SignUp;

class DrawarScreen extends StatefulWidget {
  const DrawarScreen({super.key});

  @override
  State<DrawarScreen> createState() => _DrawarScreenState();
}

class _DrawarScreenState extends State<DrawarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Example"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ✅ DrawerHeader مع خلفية صورة
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/lightbox.jpg'),
                  fit: BoxFit.cover, // تخلي الصورة تغطي كل الخلفية
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Welcome User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),

            ExpansionTile(title: Text("Profile"),children: [
              ListTile(
                leading: const Icon(Icons.account_circle),
                title:  Text('change pass'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('change name'),
                onTap: () {},
              ),

            ],),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('profile'),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp(),));

              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
