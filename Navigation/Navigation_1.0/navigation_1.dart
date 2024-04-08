import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen_x.dart';
import 'package:flutter_application_1/screens/screen_one.dart';
import 'package:flutter_application_1/screens/screen_two.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: "Navigation Demo",
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenOne(),
        '/second': (context) => ScreenTwo()
      },

      // home: ScreenOne(),
    );
  }
}