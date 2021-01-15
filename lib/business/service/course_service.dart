import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/constant/list-courses-type.dart';
import 'package:advanced_mobile_final_project/constant/top-courses-type.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/network/course_network.dart';
import 'package:advanced_mobile_final_project/widget/course-horizontal.dart';
import 'package:advanced_mobile_final_project/widget/course-widget.dart';
import 'package:flutter/material.dart';

class CourseService {
  static Future<List<Widget>> getListCourses(int filter, BuildContext context, ListCourseType type) async {
    List<CourseModel> courses = await filterChoice(filter);

    switch (type) {
      case ListCourseType.LIST_HORIZONTAL:
        return convertToCourseHorizontal(courses, context);

      case ListCourseType.LIST_VERTICAL:
        return convertToCourseVertical(courses);
    }

    return List();
  }

  static Future<List<Widget>> searchCourses(String content, int page) async {
    List<CourseModel> courses = await CourseNetwork.searchCourses(content, 7, page);
    return convertToCourseVertical(courses);
  }

  static Future<List> filterChoice(int filter) async {
    List<CourseModel> courses;
    if (filter == TopCourseType.TOP_NEW) {
      courses = await CourseNetwork.getTopNewCourses(10, 1);
    } else if (filter == TopCourseType.TOP_SELL) {
      courses = await CourseNetwork.getTopSellCourses(10, 1);
    } else if (filter == TopCourseType.TOP_RATE) {
      courses = await CourseNetwork.getTopRateCourses(10, 1);
    }

    return courses;
  }

  static List<Widget> convertToCourseHorizontal(List<CourseModel> courses, BuildContext context) {
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
              child: CourseHorizontal(course),
            ),
          )
      );
    }
    return result;
  }

  static List<Widget> convertToCourseVertical(List<CourseModel> courses) {
    List<Widget> result = new List<Container>();
    for (CourseModel course in courses) {
      result.add(
          Container(
            margin: EdgeInsets.all(Constant.insetCourse),
            child: CourseWidget(course: course)
          )
      );
    }
    return result;
  }
}