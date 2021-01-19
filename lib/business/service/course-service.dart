import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/constant/list-courses-type.dart';
import 'package:advanced_mobile_final_project/constant/top-courses-type.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/network/course-network.dart';
import 'package:advanced_mobile_final_project/widget/course-horizontal-widget.dart';
import 'package:advanced_mobile_final_project/widget/course-vertical-widget.dart';
import 'package:flutter/material.dart';

class CourseService {
  static Future<List<Widget>> getListCourses(int filter, BuildContext context, ListCourseType type, {int limit = 8}) async {
    List<CourseModel> courses = await filterChoice(filter, limit);

    switch (type) {
      case ListCourseType.LIST_HORIZONTAL:
        return convertToCourseHorizontal(courses);

      case ListCourseType.LIST_VERTICAL:
        return convertToCourseVertical(courses);
    }

    return List();
  }

  static Future<List<Widget>> searchCourses(String content, int page) async {
    List<CourseModel> courses = await CourseNetwork.searchCourses(content, 7, page);
    return convertToCourseVertical(courses);
  }

  static Future<List> filterChoice(int filter, int limit) async {
    List<CourseModel> courses;
    if (filter == TopCourseType.TOP_NEW) {
      courses = await CourseNetwork.getTopNewCourses(limit, 1);
    } else if (filter == TopCourseType.TOP_SELL) {
      courses = await CourseNetwork.getTopSellCourses(limit, 1);
    } else if (filter == TopCourseType.TOP_RATE) {
      courses = await CourseNetwork.getTopRateCourses(limit, 1);
    }

    return courses;
  }

  static Future<List<Widget>> getRecommendCourses(String id) async {
    List<CourseModel> courses = await CourseNetwork.getRecommendCourses(id, 6, 1);
    return convertToCourseHorizontal(courses);
  }

  static Future<List<Widget>> getRecommendCoursesMore(String id) async {
    List<CourseModel> courses = await CourseNetwork.getRecommendCourses(id, 10, 1);
    return convertToCourseVertical(courses);
  }

  static List<Widget> convertToCourseHorizontal(List<CourseModel> courses) {
    List<Widget> result = new List<Container>();

    for (CourseModel course in courses) {
      result.add(
          Container(
            margin: EdgeInsets.all(Constant.insetCourse),
            child: CourseHorizontalWidget(courseModel: course)
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
            child: CourseVerticalWidget(course: course)
          )
      );
    }
    return result;
  }

  static Future<List<Widget>> getCourseByType(String id) async {
    List<CourseModel> courses = await CourseNetwork.getCourseByType(id);
    return convertToCourseVertical(courses);
  }

  static Future<List<Widget>> getMyCourses(String token, ListCourseType type) async {
    List<CourseModel> courses = await CourseNetwork.getCourseRegister(token);

    switch (type) {
      case ListCourseType.LIST_HORIZONTAL:
        return convertToCourseHorizontal(courses);

      case ListCourseType.LIST_VERTICAL:
        return convertToCourseVertical(courses);
    }

    return List();
  }
}