
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos/todo_model.dart';
import 'package:riverpod_todos/todo_provider.dart';

void main() {
 runApp(ProviderScope(
    child: MyApp(),
  ));
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
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final todos= ref.watch(todosProvider);
    return Scaffold(
      backgroundColor: Colors.green.shade200,
        appBar: AppBar( 
        backgroundColor: Colors.green.shade200,
        title: Text("Todos using Riverpod Flutter"),
        centerTitle: true,
        elevation: 8,
        
      ),
        body: todos.when(
            data: (todos) {
              return ListView.builder( 
                
              itemCount: todos.length,
              itemBuilder: (context, index){ 
                ToDo todo = todos[index];
                return ToDoTile(
                  id: todo.id,
                  userId: todo.userId,
                  title: todo.title, 
                  completed: todo.completed ,
                  todo: todo,
                  );
              },
            );
            },
            error: (error, s) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
}
}




class ToDoTile extends StatelessWidget {
  ToDoTile({super.key, required this.id, required this.userId, required this.title, required this.completed, required this.todo});
  String title;
  int id;
  int userId;
  bool completed;
  ToDo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile( 
        tileColor: const Color.fromARGB(255, 101, 179, 105),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color: Colors.black)),
        leading: Checkbox(value: completed, onChanged: (value) => completed = !completed,),
        title: Text(title) ,
        subtitle: Row( 
          children: [ 
            Text("id: $id"),
            SizedBox(width: 20,),
            Text("user id: $userId")
          ],

        ),
         onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ToDoDetailScreen(todo: todo),
              ),
            );
          },
        
      ),
    );
  }
}


class ToDoDetailScreen extends StatelessWidget {
  final ToDo todo;

  const ToDoDetailScreen({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Container( 
        height: 300,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(8),
        color: Colors.green.shade300,
        child: Center(
          child: Column( 
          
            children: [ 
              Row( 
                
                children: [ 
                  Text("Todo Id: ",textAlign: TextAlign.start,), 
                  SizedBox(width: 10,),
                  Text(todo.id.toString()),
                
                ],
              ), 
              Row( 
                children: [ 
                  Text("User Id: "), 
                  SizedBox(width: 10,),
                  Text(todo.userId.toString()),
                
                ],
              ), 
               Row( 
                children: [ 
                  Text("Title: ", textAlign: TextAlign.start,), 
                  SizedBox(width: 10,),
                  Flexible(child: Text(todo.title,)),
                
                ],
              ),
               Row( 
                children: [ 
                  Text("Completed: "), 
                  SizedBox(width: 10,),
                  Text(todo.completed.toString()),
                
                ],
              )
                
            
            ],
          ),
        ),
      )
      
      
      
    );
  }
}


