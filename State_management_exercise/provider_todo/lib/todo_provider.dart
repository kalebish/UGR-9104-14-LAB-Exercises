import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_todo/todo_model.dart';


class ToDoProvider extends ChangeNotifier{ 
  static const endpoint = "https://jsonplaceholder.typicode.com/todos";

  List<ToDo> _tasks = [];

  List<ToDo> get tasks => _tasks;

  Future<void> fetchToDO() async {
    final response = await http
      .get(Uri.parse(endpoint));
    
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      
      _tasks = data.map((json)=> ToDo.fromJson(json)).toList();
        notifyListeners();


      } else {
        throw Exception('Failed to load todos');
      }
}
}

