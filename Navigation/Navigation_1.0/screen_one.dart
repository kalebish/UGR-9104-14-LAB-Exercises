import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen_two.dart';


class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Screen One"),
      ),
      body: Center( 
        child: ElevatedButton( 
          child: const Text( 
            "Next one"
          ),
          onPressed: (){ 
        //     Navigator.push(context,
        //  MaterialPageRoute(builder: (BuildContext context) => ScreenTwo()));
          Navigator.pushNamed(context, "/two");
          },
        ),
      ),
    );
  }
}