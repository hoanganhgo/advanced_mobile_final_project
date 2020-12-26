import 'dart:convert';

import 'package:advanced_mobile_final_project/model/course_model.dart';
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

    return data;
  }

  static Future<List<CourseModel>> getTopSellCourses() async {
    var url = 'http://api.dev.letstudy.org/course/top-sell';
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

  static Future<List<CourseModel>> getTopRateCourses() async {
    var url = 'http://api.dev.letstudy.org/course/top-rate';
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
    var requirement = course['requirement'] == null ? 'None' : course['requirement'][0];
      return new CourseModel(imageLink: course['imageUrl'], videoLink: course['promoVidUrl'],
          courseName: course['title'], authorName: course['instructor.user.name'],
          requirement: requirement, updateAt: DateTime.parse(course['updatedAt']),
          rates: course['ratedNumber'], description: course['description'], totalHours: course['totalHours']);
  }
}