import 'dart:convert';

import 'package:advanced_mobile_final_project/business/adapter/mapping.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/model/comment-model.dart';
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

  static Future<List<CourseModel>> _processDataCourses(dynamic response) async {
    List<CourseModel> data = new List();

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> list = json['payload'];
    //print(list);

    if (list == null) {
      return data;
    }

    for (dynamic course in list) {
      CourseModel courseModel = Mapping.mapToCourseModel(course);
      Map<String, dynamic> json2 = await getDetailJson(courseModel.id);

      if (json2['payload'] == null) {
        continue;
      }

      courseModel.comments = getComments(json2);
      courseModel.sumFinish = getSumLessonFinish(json2);
      data.add(courseModel);
    }

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
    //print(json);

    List<CourseModel> data = new List();

    for (dynamic course in list) {
      CourseModel courseModel = Mapping.mapToCourseModelForSearch(course);
      Map<String, dynamic> json = await getDetailJson(courseModel.id);
      courseModel.comments = getComments(json);
      courseModel.sumFinish = getSumLessonFinish(json);
      data.add(courseModel);
    }

    return data;
  }

  static Future<List> getRecommendCourses(String id, int limit, int page) async {
    int offset = (page - 1) * limit;

    var url = API.RECOMMEND_COURSE + "/" + id + "/" + limit.toString() +
        "/" + offset.toString();
    var response = await http.get(url);

    return _processDataCourses(response);
  }

  static Future<List> getCourseByType(String id) async {
    var url = "http://api.dev.letstudy.org/course/search";

    Map<String, dynamic> map = {
      "keyword": "",
      "opt": {
        "category": [
          id
        ]
      },
      "limit": '10',
      "offset": '0'
    };

    final String encodedData = jsonEncode(map);

    var response = await http.post(url, body: encodedData, headers: {
      "content-type": "application/json"
    });

    List<CourseModel> data = new List();

    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);

    List<dynamic> list = json['payload']["rows"];

    if (list == null) {
      return data;
    }

    for (dynamic course in list) {
      CourseModel courseModel = Mapping.mapToCourseModel(course);
      Map<String, dynamic> json = await getDetailJson(courseModel.id);
      courseModel.comments = getComments(json);
      courseModel.sumFinish = getSumLessonFinish(json);
      data.add(courseModel);
    }

    return data;
  }

  static Future<CourseModel> getCourseDetail(String courseId) async {
    String url = API.LESSON + "/" + courseId  + "/" + courseId;
    var response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    dynamic courseJson = json['payload'];

    CourseModel course = Mapping.mapToCourseModel(courseJson);

    Map<String, dynamic> json2 = await getDetailJson(course.id);
    course.comments = getComments(json2);
    course.sumFinish = getSumLessonFinish(json2);

    return course;
  }
  
  static Future<bool> registerCourse(String token, String courseId) async {
    var response = await http.post(API.REGISTER_COURSE, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      "courseId": courseId
    });

    return response.statusCode == 200;
  }

  static Future<List<CourseModel>> getCourseRegister(String token) async {
    var response = await http.get(API.MY_COURSE, headers: {
      'Authorization': 'Bearer $token'
    });

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> list = json["payload"];

    List<CourseModel> data = new List();

    for (dynamic courseBasic in list) {
      data.add(await CourseNetwork.getCourseDetail(courseBasic["courseId"]));
    }

    return data;
  }

  static Future<bool> likeCourse(String token, String courseId) async {
    var response = await http.post(API.LIKE_COURSE,
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "courseId": courseId
        });

    return response.statusCode == 200;
  }

  static Future<bool> statusLikeCourse(String token, String courseId) async {
    var url = API.STATUS_LIKE + "/" + courseId;
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token'
    });

    Map<String, dynamic> json = jsonDecode(response.body);

    dynamic status = json["likeStatus"];

    return status == true;
  }

  static Future<List<CourseModel>> getFavoriteCourses(String token) async {
    var response = await http.get(API.FAVORITE_COURSE, headers: {
      'Authorization': 'Bearer $token'
    });

    List<CourseModel> data = new List();

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> list = json['payload'];
    // print(list);

    if (list == null) {
      return data;
    }

    for (dynamic course in list) {
      CourseModel courseModel = Mapping.mapToCourseModelV2(course);
      Map<String, dynamic> json = await getDetailJson(courseModel.id);
      courseModel.videoLink = json["payload"]["promoVidUrl"] == null ? "" : json["payload"]["promoVidUrl"];
      courseModel.description = json["payload"]["description"] == null ? "" : json["payload"]["description"];
      courseModel.rates = json["payload"]["ratedNumber"] == null ? 0 : json["payload"]["ratedNumber"];
      courseModel.comments = getComments(json);
      courseModel.sumFinish = getSumLessonFinish(json);
      courseModel.like = await statusLikeCourse(token, courseModel.id);
      data.add(courseModel);
    }

    return data;
  }

  static Future rateCourse(String token, String courseId, double star, String content) async {
    var response = await http.post(API.RATE_COURSE,
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "courseId": courseId,
          "formalityPoint": star.toString(),
          "contentPoint": star.toString(),
          "presentationPoint": star.toString(),
          "content": content
        });
  }

  static Future<Map<String, dynamic>> getDetailJson(String courseId) async {
    String url = API.LESSON + "/" + courseId  + "/" + courseId;
    var response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    return json;
  }

  static List<CommentModel> getComments(Map<String, dynamic> json) {
    List<dynamic> list = json['payload']["ratings"]["ratingList"];

    List<CommentModel> data = new List();

    if (list == null) {
      return data;
    }

    list.forEach((comment) {
      data.add(Mapping.mapToCommentModel(comment));
    });

    return data;
  }

  static double getSumLessonFinish(Map<String, dynamic> json) {
      dynamic sumLessonFinish = json["payload"]["section"][0]["sumLessonFinish"];
      return sumLessonFinish + 0.0;
  }
}
