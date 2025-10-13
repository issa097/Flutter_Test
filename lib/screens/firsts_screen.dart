import 'package:flutter/material.dart';
import 'package:untitled2/screens/custom_continer.dart';
import 'package:untitled2/screens/secand_screen.dart';


class FirstsScreen extends StatelessWidget {
  const FirstsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "First Screen",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.person),
        actions: [
          Icon(Icons.logout),
          Icon(Icons.add_shopping_cart),
          Icon(Icons.login),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ],
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SecandScreen(),
            SecandScreen(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "data",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "data",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "data",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SecandScreen(),

            SecandScreen(),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                CustomContiner(),
                CustomContiner(),
                CustomContiner(),
                CustomContiner(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
