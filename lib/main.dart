import 'package:flutter/material.dart';
import './timer.dart';
import 'package:flutter/services.dart';


void main() {  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Timer(),
    theme: ThemeData(fontFamily: 'Shot'),
  ));
}
