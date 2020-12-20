import 'dart:convert';

import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/share/course/course.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CourseService {
  static Future<List<CourseModel>> getTopNewCourses() async {
    var url = 'http://api.dev.letstudy.org/course/top-new';
    var response = await http.post(url, body: {
      'limit': '10',
      'page': '1'
    });
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> list = json['payload'];

    List<CourseModel> data = new List();
    list.forEach((course) {
      data.add(mapToCourseModel(course));
    });

    data.forEach((element) {
      print(element.courseName);
    });
    return data;
  }

  static CourseModel mapToCourseModel(dynamic course) {
      return new CourseModel(imageLink: course['imageUrl'], courseName: course['title'],
      authorName: course['instructor.user.name'], requirement: course['requirement'][0],
      updateAt: DateTime.parse(course['updatedAt']), rates: course['ratedNumber']);
  }
}