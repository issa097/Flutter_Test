import 'package:flutter/material.dart';

class ListViewSeparatorScreen extends StatefulWidget {
  const ListViewSeparatorScreen({super.key});

  @override
  State<ListViewSeparatorScreen> createState() => _ListViewSeparatorScreenState();
}

class _ListViewSeparatorScreenState extends State<ListViewSeparatorScreen> {
  List<String> names =["issa","yazan","anas","karam","issa","issa","yazan","anas","karam","issa","issa","yazan","anas","karam","issa","yazan","anas","karam"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list builder1"),
        centerTitle: true,
      ),

      body: ListView.separated(
        itemCount: names.length,
        separatorBuilder:(context,index) {
          return SizedBox(height: 10,);
        },

        itemBuilder: (context,index){
          return    Container(
            height: 50,
            color: Colors.amber[600],
            child:  Center(child: Text(names[index])),
          );
        },


      ),


    );
  }
}
