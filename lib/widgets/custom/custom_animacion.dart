import 'package:flutter/material.dart';


class CustomAnimacion extends PageRouteBuilder {
 final Widget page;
 final Duration duracion;
 final Curve curves;
 final Alignment acomodo;

  CustomAnimacion({
  required this.page,
  this.duracion = const Duration(milliseconds: 1000), 
  this.curves = Curves.easeInBack,
  this.acomodo = const Alignment(0, 0),

 }) : super(
      transitionDuration: duracion,
       transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,
        Widget child
    ){
       animation = CurvedAnimation(
       parent: animation, 
       curve: curves,
      );
      return ScaleTransition(
      alignment: acomodo,
      scale: animation,
      child: child, 
      );},
        pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,) => page,
  );
 
  
}