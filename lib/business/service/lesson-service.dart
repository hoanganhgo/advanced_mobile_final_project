import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/lesson-model.dart';
import 'package:advanced_mobile_final_project/network/lesson-network.dart';
import 'package:advanced_mobile_final_project/widget/lesson-widget.dart';
import 'package:flutter/material.dart';

class LessonService {
  static Future<List<Widget>> getListLesson(String courseId) async {
    List<LessonModel> lessons = await LessonNetwork.getListLesson(courseId);

    List<Widget> result = new List<Container>();

    for (LessonModel course in lessons) {
      result.add(
          Container(
              margin: EdgeInsets.all(Constant.insetCourse),
              child: LessonWidget(course)
          )
      );
    }

    return result;
  }
}