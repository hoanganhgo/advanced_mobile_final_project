import 'dart:math';

import 'package:advanced_mobile_final_project/business/service/course_service.dart';
import 'file:///E:/Advanced%20Mobile/advanced_mobile_final_project/lib/widget/author-vertical.dart';
import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/network/author-network.dart';
import 'package:advanced_mobile_final_project/network/course_network.dart';
import 'package:flutter/material.dart';

class AuthorService {
  static Future<List<Widget>> getAllAuthors(String keyword, int page) async {
    List<AuthorModel> authors = await AuthorNetwork.searchAuthors(keyword, 7, page);

    return convertToAuthorVertical(authors);
  }

  static List<Widget> convertToAuthorVertical(List<AuthorModel> authors) {
    List<Widget> result = new List<Widget>();

    for (AuthorModel author in authors) {
      result.add(
          Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: AuthorVertical(author))
      );
    }

    return result;
  }

  static Future<List<Widget>> getAll(String keyword, int page) async {
    List<AuthorModel> authors = await AuthorNetwork.searchAuthors(keyword, 4, page);
    List<Widget> list1 = convertToAuthorVertical(authors);

    List<CourseModel> courses = await CourseNetwork.searchCourses(keyword, 4, page);
    List<Widget> list2 = CourseService.convertToCourseVertical(courses);

    List<Widget> list = new List();

    var rand = new Random();
    int i = 0;
    int j = 0;

    while (i < list1.length && j < list2.length) {
      if (rand.nextInt(2) == 0) {
        list.add(list1[i]);
        i++;
      } else {
        list.add(list2[j]);
        j++;
      }
    }

    while (i < list1.length) {
      list.add(list1[i]);
      i++;
    }

    while (j < list2.length) {
      list.add(list2[j]);
      j++;
    }

    return list;
  }
}