import 'package:flutter/material.dart';

class ListViewBulderScreen extends StatefulWidget {
  const ListViewBulderScreen({super.key});

  @override
  State<ListViewBulderScreen> createState() => _ListViewBulderScreenState();
}

class _ListViewBulderScreenState extends State<ListViewBulderScreen> {
  List<String> names =["issa","yazan","anas","karam","issa","issa","yazan","anas","karam","issa","issa","yazan","anas","karam","issa","yazan","anas","karam"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list builder1"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index){
          return    Container(
            height: 50,
            color: Colors.amber[600],
            child:  Center(child: Text(names[index])),
          );
        }
      ),
    );
  }
}
