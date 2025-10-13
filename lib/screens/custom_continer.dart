import 'package:flutter/material.dart';

class CustomContiner extends StatelessWidget {
  const CustomContiner ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,

      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black, width: 10),
      ),
      child: Center(
        child: Text("qwer", style: TextStyle(color: Colors.red),
        ),

      ),
    );
  }
}
