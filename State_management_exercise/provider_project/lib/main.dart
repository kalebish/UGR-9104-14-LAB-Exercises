import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/counter.dart';

void main() {
  runApp( 
    ChangeNotifierProvider(create: (context) => Counter(),
    child: MyApp(),
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }

}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.title});
  String title;


  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>( 
      builder: (context, value, child){ 
        return Scaffold( 
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Your current score is:',
                    ),
                    Text(
                      '${value.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
          floatingActionButton: Row( 
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 

              FloatingActionButton(
                onPressed: () =>   value.incrementCounter(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ), 
              SizedBox(width: 10,),
              FloatingActionButton(
                onPressed: () =>   value.decrementCounter(),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          )
          
          
           

        );

      },
    );
  }
}







