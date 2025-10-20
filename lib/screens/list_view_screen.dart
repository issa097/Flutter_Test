import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListViewScreen  extends StatefulWidget {
  const ListViewScreen ({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("list"),
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
body:ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 50,
      color: Colors.amber[600],
      child:  Center(child: Text("Entry A".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child:  Center(child: Text("Entry B".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child:  Center(child: Text("Entry C".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[600],
      child:  Center(child: Text("Entry A".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child:  Center(child: Text("Entry B".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child:  Center(child: Text("Entry C".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[600],
      child:  Center(child: Text("Entry A".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child:  Center(child: Text("Entry B".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child:  Center(child: Text("Entry C".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[600],
      child:  Center(child: Text("Entry A".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child:  Center(child: Text("Entry B".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child:  Center(child: Text("Entry C".tr())),
    ),    Container(
      height: 50,
      color: Colors.amber[600],
      child:  Center(child: Text("Entry A".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child:  Center(child: Text("Entry B".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child:  Center(child: Text("Entry C".tr())),
    ),    Container(
      height: 50,
      color: Colors.amber[600],
      child:  Center(child: Text("Entry A".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child:  Center(child: Text("Entry B".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child:  Center(child: Text("Entry C".tr())),
    ),    Container(
      height: 50,
      color: Colors.amber[600],
      child:  Center(child: Text("Entry A".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child:  Center(child: Text("Entry B".tr())),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child:  Center(child: Text("Entry C".tr())),
    ),




  ],
),
    );
  }
}
