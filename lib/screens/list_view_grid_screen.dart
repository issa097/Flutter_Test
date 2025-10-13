import 'package:flutter/material.dart';

class ListViewGridScreen extends StatefulWidget {
  const ListViewGridScreen({super.key});

  @override
  State<ListViewGridScreen> createState() => _ListViewGridScreenState();
}

class _ListViewGridScreenState extends State<ListViewGridScreen> {
  List<String> names =["issa","yazan","anas","karam","issa","issa","yazan","anas","karam","issa","issa","yazan","anas","karam","issa","yazan","anas","karam"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list builder1"),
        centerTitle: true,
      ),

      body:

      GridView.builder(
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
         itemCount: names.length,
          itemBuilder: (context, index){
            return    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Colors.amber[600],
                child:  Center(child: Text(names[index])),
              ),
            );
          } ,


      ),







    );
  }
}
