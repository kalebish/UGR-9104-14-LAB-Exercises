import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen_one.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Screen Two"),
      ),
      body: Center( 
        child: ElevatedButton( 
          child: const Text( 
            "Back"
          ),
          onPressed: (){ 
             Navigator.pop(context);
          },
        ),
      ),
    );
  }
}