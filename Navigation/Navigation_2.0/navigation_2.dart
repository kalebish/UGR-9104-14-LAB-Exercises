import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/course_details_screen.dart';
import 'package:flutter_application_1/screens/course_list_screen.dart';
import 'package:flutter_application_1/utils/course.dart';


void main(){
  runApp(CourseApp());
}

class CourseApp extends StatefulWidget {
  const CourseApp({super.key});

  @override
  State<CourseApp> createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {
  Course? _selectedCourse;
  void _tabHandler(Course course){ 
    setState(() {
      _selectedCourse = course;
    });
  }
  

  List<Course> courses = [
    Course(
        code: "SiTE-001",
        title: "Introduction To Programming",
        description: "Computer Organization, Architecture, Programming"
        ),
    Course(
       code: "SiTE-002",
        title: "Mobile Programming",
        description: "Flutter, Kotlin, Java, Mobile applications"
    ),
    Course( 
       code: "SiTE-003",
        title: "Web Development and Design",
        description: "css, javascript, html"
    )
  ];

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
              key: const ValueKey('CourseListScreen'),
              child: CoursesListScreen(
                  courses: courses,
                  onTapped: _tabHandler,
          )), 
          if (_selectedCourse != null)
            MaterialPage(
              key: ValueKey(_selectedCourse),
            child: CourseDetailsScreen(course: _selectedCourse!))
        ],
        onPopPage: (route, result) {
         if (!route.didPop(result)) {
           return false;
         }
         setState(() {
           _selectedCourse = null;
         });
         return true;
       },

      ),  
    );

  }
}