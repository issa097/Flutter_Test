import 'package:flutter/material.dart';
import 'package:untitled2/screens/custom_continer.dart';
import 'package:untitled2/screens/drawar_screen.dart' show DrawarScreen;
import 'package:untitled2/screens/firsts_screen.dart';
import 'package:untitled2/screens/images.dart';
import 'package:untitled2/screens/item_screen.dart' show ItemScreen;
import 'package:untitled2/screens/list_view_bulder_screen.dart' show ListViewBulderScreen;
import 'package:untitled2/screens/list_view_grid_screen.dart' show ListViewGridScreen;
import 'package:untitled2/screens/list_view_screen.dart';
import 'package:untitled2/screens/list_view_separator_screen.dart' show ListViewSeparatorScreen;
import 'package:untitled2/screens/login.dart';
import 'package:untitled2/screens/secand_screen.dart';
import 'package:untitled2/screens/sign_up.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0 ;
  List<Widget> _pages = [
    FirstsScreen(),
    Text("data"),
    SecandScreen(),
    CustomContiner(),
    Login(),
    SignUp(),
    ListViewScreen(),
    ListViewBulderScreen(),
    ListViewSeparatorScreen(),
    ListViewGridScreen(),
    Images(),
    DrawarScreen(),
    ItemScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex],),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });

          print("index : $_selectedIndex");
        },

        items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home",
      backgroundColor: Colors.yellow
      ),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile", backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "search", backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "favorite", backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.login),label: "favorite", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: "favorite", backgroundColor: Colors.pink)




        ]) ,
    );
  }
}
