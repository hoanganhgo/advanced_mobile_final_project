import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/share/course/course_horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  String searchContent = '';
  Search({this.searchContent});

  var courses = [
    new CourseModel(imageLink: 'assets/images/csharp.jpg', courseName: 'C# develop advanced for student',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/csharp.jpg', courseName: 'C# develop advanced for student',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', date: new DateTime.now(), stars: 4, rates: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: CourseHorizontal.getListCourses(this.courses)
    );
  }
}