import 'package:advanced_mobile_final_project/constant/top-courses-type.dart';
import 'package:advanced_mobile_final_project/ui/course/list-course-horizontal.dart';
import 'package:advanced_mobile_final_project/ui/course/list-my-course.dart';
import 'package:advanced_mobile_final_project/widget/course/header-course.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          HeaderCourse(title: S.current.my_courses, seeMore: () {
            Navigator.pushNamed(context, '/list-my-course', arguments: {
              'name': 'My Courses',
            });
          }),
          ListMyCourse(),
          HeaderCourse(title: S.current.top_new_courses, seeMore: () {
            Navigator.pushNamed(context, '/list-course', arguments: {
              'name': 'Top New Courses',
              'filter': TopCourseType.TOP_NEW
            });
          }),
          ListCourseHorizontal(TopCourseType.TOP_NEW),
          Divider(),
          HeaderCourse(title: S.current.top_sell_courses, seeMore: () {
            Navigator.pushNamed(context, '/list-course', arguments: {
              'name': 'Top New Courses',
              'filter': TopCourseType.TOP_SELL
            });
          }),
          ListCourseHorizontal(TopCourseType.TOP_SELL),
          Divider(),
          HeaderCourse(title: S.current.top_rate_courses, seeMore: () {
            Navigator.pushNamed(context, '/list-course', arguments: {
              'name': 'Top New Courses',
              'filter': TopCourseType.TOP_RATE
            });
          }),
          ListCourseHorizontal(TopCourseType.TOP_RATE),
        ],
      ),
    );
  }
}