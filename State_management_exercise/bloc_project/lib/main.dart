import 'package:bloc_project/counter-bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Bloc Demo '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your current score is:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterLoaded) {
                  return Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                }
                return const Text('Error');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).add(CounterIncremented()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).add(CounterDecremented()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}



