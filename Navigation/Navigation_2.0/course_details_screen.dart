import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/course.dart';


class CourseDetailsScreen extends StatelessWidget {
 final Course course;
 const CourseDetailsScreen({required this.course});
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(course.title)),
     body: Center(
       child: Column(
         children: [
           Text(course.title),
           Text(course.code),
           Text(course.description),
         ],
       ),
      ),
    );
 }
}
