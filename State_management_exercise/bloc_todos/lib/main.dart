import 'package:bloc_todos/todo_bloc.dart';
import 'package:bloc_todos/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: TodoScreen(),
      ),
    );
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
      todoBloc.add(FetchTodos());

    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar( 
        backgroundColor: Colors.green.shade200,
        title: Text("Todos using BloC Flutter"),
        centerTitle: true,
        elevation: 8,
        
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ToDoTile(
                  id: todo.id,
                 userId: todo.userId, 
                 title: todo.title, 
                 completed: todo.completed, 
                 todo: todo);
              },
            );
          } else if (state is TodoError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
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


