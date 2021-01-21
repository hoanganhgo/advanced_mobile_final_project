import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/exercise-model.dart';
import 'package:advanced_mobile_final_project/model/lesson-model.dart';
import 'package:advanced_mobile_final_project/network/lesson-network.dart';
import 'package:advanced_mobile_final_project/widget/exercise-widget.dart';
import 'package:advanced_mobile_final_project/widget/lesson-widget.dart';
import 'package:flutter/material.dart';

class LessonService {
  static Future<List<Widget>> getListLesson(CourseModel courseModel) async {
    List<LessonModel> lessons = await LessonNetwork.getListLesson(courseModel.id);

    List<Widget> result = new List<Container>();

    for (LessonModel lesson in lessons) {
      result.add(
          Container(
              margin: EdgeInsets.all(Constant.insetCourse),
              child: LessonWidget(lesson, courseModel)
          )
      );
    }

    return result;
  }

  static Future<List<Widget>> getListExercise(String token, String lessonId) async {
    List<ExerciseModel> exercises = await LessonNetwork.getListExercise(token, lessonId);

    List<Widget> result = new List<Container>();

    for (ExerciseModel exercise in exercises) {
      result.add(
          Container(
              margin: EdgeInsets.all(Constant.insetCourse),
              child: ExerciseWidget(exercise)
          )
      );
    }

    return result;
  }
}