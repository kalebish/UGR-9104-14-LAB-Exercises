import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen_x.dart';


class ScreenY extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  //  final text = ModalRoute.of(context)!.settings.arguments as String;
   return Scaffold(
     appBar: AppBar(
       title: const Text("Screen Y"),
     ),
     body: Center(child: ElevatedButton( 
      onPressed: (){ 
        Navigator.pop(context, "yes");
      },
      child: Text("Go back"),
     )),
   );
 }
}

