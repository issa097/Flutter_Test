import 'package:flutter/material.dart';

 class SecandScreen extends StatelessWidget {
   const SecandScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return Text(
         "data",
         style: TextStyle(
           fontSize: 25,
           fontWeight: FontWeight.bold,
           color: Colors.red,
         )
     );
   }


 }