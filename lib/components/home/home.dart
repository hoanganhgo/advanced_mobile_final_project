import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/constant/top-courses-type.dart';
import 'package:advanced_mobile_final_project/ui/list-course-horizontal.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Row headerCourse(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: TextStyle(
            fontSize: Constant.titleCourseSize,
            fontWeight: Constant.titleCourseWeight,
          ),
        ),
        InkWell(
          child: Text(
            'See all >',
            style: TextStyle(
              color: Colors.black,
              fontSize: Constant.seeAllSize,
            ),
          ),
          onTap: () {

          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        this.headerCourse("Top New Courses"),
        ListCourseHorizontal(TopCourseType.TOP_NEW),
        Divider(),
        this.headerCourse("Top Sell Courses"),
        ListCourseHorizontal(TopCourseType.TOP_SELL),
        Divider(),
        this.headerCourse("Top Rate Courses"),
        ListCourseHorizontal(TopCourseType.TOP_RATE),
      ],
    );
  }
}