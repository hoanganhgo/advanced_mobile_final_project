import 'dart:convert';

import 'package:advanced_mobile_final_project/business/share/course/course.dart';
import 'package:advanced_mobile_final_project/constant/top-courses-type.dart';
import 'file:///E:/Advanced%20Mobile/advanced_mobile_final_project/lib/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/network/course_network.dart';
import 'package:flutter/material.dart';

class CourseService {
  static Future<List<Widget>> getListCourses(int filter, BuildContext context) async {
    List<CourseModel> courses;
    if (filter == TopCourseType.TOP_NEW) {
      courses = await CourseNetwork.getTopNewCourses(10, 1);
    } else if (filter == TopCourseType.TOP_SELL) {
      courses = await CourseNetwork.getTopSellCourses(10, 1);
    } else if (filter == TopCourseType.TOP_RATE) {
      courses = await CourseNetwork.getTopRateCourses(10, 1);
    }

    List<Widget> result = new List<Container>();
    for (CourseModel course in courses) {
      result.add(
          Container(
            margin: EdgeInsets.all(Constant.insetCourse),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/video-course', arguments: course);
              },
              color: Constant.bgColorCourse,
              child: Course(course),
            ),
          )
      );
    }
    return result;
  }
}