import 'dart:convert';

import 'package:advanced_mobile_final_project/business/adapter/mapping.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/model/exercise-model.dart';
import 'package:advanced_mobile_final_project/model/lesson-model.dart';
import 'package:http/http.dart' as http;

class LessonNetwork {
  static Future<List<LessonModel>> getListLesson(String courseId) async {
    String url = API.LESSON + "/" + courseId  + "/" + courseId;
    var response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> list = json['payload']["section"][0]["lesson"];
    print(list);

    List<LessonModel> data = new List();

    if (list == null) {
      return data;
    }

    list.forEach((course) {
      data.add(Mapping.mapToLessonModel(course));
    });

    return data;
  }

  static Future<List<ExerciseModel>> getListExercise(String token, String lessonId) async {
    var response = await http.post(API.EXERCISE,
    headers: {
      'Authorization': 'Bearer $token'
    },
    body: {
      "lessonId": lessonId
    });

    Map<String, dynamic> json = jsonDecode(response.body);
    print(json);

    List<dynamic> list = json['payload']["exercises"];

    List<ExerciseModel> data = new List();

    list.forEach((exercise) {
      data.add(Mapping.mapToExerciseModel(exercise));
    });

    return data;
  }
}