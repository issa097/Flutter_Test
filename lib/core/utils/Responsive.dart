import 'package:flutter/material.dart';



double ResponsiveHeight (
BuildContext context ,
double value , {

  double baseHeight =  965,
}) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (value / baseHeight ) * screenHeight;
}



double Responsivewidth (
    BuildContext context ,
    double value , {

      double basewidth =  500,
    }) {
  double screenwidth = MediaQuery.of(context).size.height;
  return (value / basewidth ) * screenwidth;
}

