import 'dart:convert';

import 'package:advanced_mobile_final_project/business/adapter/mapping.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CourseNetwork {
  static Future<List> getTopSellCourses(int limit, int page) async {
    var response = await http.post(API.TOP_SELL_COURSES,
        body: {'limit': limit.toString(), 'page': page.toString()});

    return _processDataCourses(response);
  }

  static Future<List> getTopNewCourses(int limit, int page) async {
    var response = await http.post(API.TOP_NEW_COURSES,
        body: {'limit': limit.toString(), 'page': page.toString()});

    return _processDataCourses(response);
  }

  static Future<List> getTopRateCourses(int limit, int page) async {
    var response = await http.post(API.TOP_RATING_COURSES,
        body: {'limit': limit.toString(), 'page': page.toString()});

    return _processDataCourses(response);
  }

  static List<CourseModel> _processDataCourses(dynamic response) {
    List<CourseModel> data = new List();

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> list = json['payload'];
    print(list);

    if (list == null) {
      return data;
    }

    list.forEach((course) {
      data.add(Mapping.mapToCourseModel(course));
    });

    return data;
  }

  static Future<List> getHistory(BuildContext context) async {
    final store = Provider.of<StoreModel>(context);
    var url = "http://api.dev.letstudy.org/course/delete-search-history";
    var response = await http.delete(url, headers: {"id": store.user.id});
    Map<String, dynamic> json = jsonDecode(response.body);
    print("History: " + json.toString());
    return null;
  }

  static Future<List> searchCourses(String keyword, int limit, int page) async {
    int offset = (page - 1) * limit;

    var response = await http.post(API.SEARCH_COURSES, body: {
      "keyword": keyword,
      "limit": limit.toString(),
      "offset": offset.toString()
    });

    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> list = json['payload']["courses"]["data"];
    print(json);

    List<CourseModel> data = new List();

    list.forEach((course) {
      data.add(Mapping.mapToCourseModelForSearch(course));
    });

    return data;
  }

  static Future<List> getRecommendCourses(String id, int limit, int page) async {
    int offset = (page - 1) * limit;

    var url = API.RECOMMEND_COURSE + "/" + id + "/" + limit.toString() +
        "/" + offset.toString();
    var response = await http.get(url);

    // var response = await http.get(API.RECOMMEND_COURSE, headers: {
    //   "id": "e434a55e-6495-4caf-b9a3-d51946885162",
    //   "limit": "10",
    //   "offset": "1"
    // });

    return _processDataCourses(response);
  }

  static Future<List> getCourseByType(String id) async {
    var url = "http://api.dev.letstudy.org/course/search";

    int offset = id.hashCode % 10;

    var response = await http.post(url, body: {
      "keyword": "",
      "limit": '5',
      "offset": offset.toString()
    });

    List<CourseModel> data = new List();

    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);

    List<dynamic> list = json['payload']["rows"];

    if (list == null) {
      return data;
    }

    list.forEach((course) {
      data.add(Mapping.mapToCourseModel(course));
    });

    return data;
  }

  static Future<CourseModel> getCourseDetail(String courseId) async {
    print(courseId);
    String url = API.COURSE_DETAIL + "/" + courseId;
    var response = await http.get(API.COURSE_DETAIL);

    print("getCourseDetail");

    List<CourseModel> data = new List();

    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);

    List<dynamic> course = json['payload'];

    print(course);

    return null;
  }


}
