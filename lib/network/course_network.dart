import 'dart:convert';

import 'package:advanced_mobile_final_project/business/adapter/mapping.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:http/http.dart' as http;

class CourseNetwork {
  static Future<List> getTopSellCourses(int limit, int page) async {
    var response = await http.post(API.TOP_SELL_COURSES, body: {
      'limit': limit.toString(),
      'page': page.toString()
    });

    return _processDataCourses(response);
  }

  static Future<List> getTopNewCourses(int limit, int page) async {
    var response = await http.post(API.TOP_NEW_COURSES, body: {
      'limit': limit.toString(),
      'page': page.toString()
    });

    return _processDataCourses(response);
  }

  static Future<List> getTopRateCourses(int limit, int page) async {
    var response = await http.post(API.TOP_RATING_COURSES, body: {
      'limit': limit.toString(),
      'page': page.toString()
    });

    return _processDataCourses(response);
  }

  static List<CourseModel> _processDataCourses(dynamic response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> list = json['payload'];

    List<CourseModel> data = new List();

    list.forEach((course) {
      data.add(Mapping.mapToCourseModel(course));
    });

    return data;
  }
}