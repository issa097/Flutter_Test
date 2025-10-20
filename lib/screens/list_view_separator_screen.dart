import 'package:easy_localization/easy_localization.dart';
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
        title: Text("list separator"),
        centerTitle: true,
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

      body: ListView.separated(
        itemCount: names.length,
        separatorBuilder:(context,index) {
          return SizedBox(height: 10,);
        },

        itemBuilder: (context,index){
          return    Container(
            height: 50,
            color: Colors.amber[600],
            child:  Center(child: Text(names[index].tr())),
          );
        },


      ),


    );
  }
}
