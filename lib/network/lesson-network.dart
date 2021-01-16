import 'dart:convert';

import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/model/lesson-model.dart';
import 'package:http/http.dart' as http;

class LessonNetwork {
  static Future<List<LessonModel>> getListLesson(String courseId, String userId) async {
    print(courseId);
    print(userId);
    String url = API.LESSON + "/" + courseId + "/" + userId;
    print(url);
    var response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);
    print("++++++++++++++++++");
    print(json);

    List<dynamic> list = json['payload'];

    return null;
  }
}