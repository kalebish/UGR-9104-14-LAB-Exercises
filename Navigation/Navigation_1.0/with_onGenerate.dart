import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen_x.dart';
import 'package:flutter_application_1/screens/screen_one.dart';
import 'package:flutter_application_1/screens/screen_two.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Navigation Demo',
     onGenerateRoute: (RouteSettings settings) {
       switch (settings.name) {
         case '/':
           return MaterialPageRoute(builder: (context) => ScreenOne());
         case '/two':
           return MaterialPageRoute(builder: (context) => ScreenTwo());
          default:
            return MaterialPageRoute(builder: (context) => ScreenOne());
        
       } 
     },
   );
 }
}
