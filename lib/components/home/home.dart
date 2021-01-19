import 'package:advanced_mobile_final_project/constant/top-courses-type.dart';
import 'package:advanced_mobile_final_project/ui/list-course-horizontal.dart';
import 'package:advanced_mobile_final_project/ui/list-my-course.dart';
import 'package:advanced_mobile_final_project/widget/header-course.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  Widget getMyCourse() {

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        HeaderCourse(title: "My Courses", seeMore: () {
          Navigator.pushNamed(context, '/list-my-course', arguments: {
            'name': 'My Courses',
          });
        }),
        ListMyCourse(),
        HeaderCourse(title: "Top New Courses", seeMore: () {
          Navigator.pushNamed(context, '/list-course', arguments: {
            'name': 'Top New Courses',
            'filter': TopCourseType.TOP_NEW
          });
        }),
        ListCourseHorizontal(TopCourseType.TOP_NEW),
        Divider(),
        HeaderCourse(title: "Top Sell Courses", seeMore: () {
          Navigator.pushNamed(context, '/list-course', arguments: {
            'name': 'Top New Courses',
            'filter': TopCourseType.TOP_SELL
          });
        }),
        ListCourseHorizontal(TopCourseType.TOP_SELL),
        Divider(),
        HeaderCourse(title: "Top Rate Courses", seeMore: () {
          Navigator.pushNamed(context, '/list-course', arguments: {
            'name': 'Top New Courses',
            'filter': TopCourseType.TOP_RATE
          });
        }),
        ListCourseHorizontal(TopCourseType.TOP_RATE),
      ],
    );
  }
}