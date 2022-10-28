import 'package:flutter/material.dart';

Color primaryOrange = Color.fromARGB(255, 255, 139, 56);
Color secondaryOrange = Color.fromARGB(255, 243, 102, 75);

TextStyle buttonText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

var buttondecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: LinearGradient(
      colors: [primaryOrange, secondaryOrange],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    boxShadow: [BoxShadow(blurRadius: 5, color: secondaryOrange)]);
