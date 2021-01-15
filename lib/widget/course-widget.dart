import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:flutter/material.dart';

import 'course_vertical.dart';

class CourseWidget extends StatelessWidget {
  CourseModel course;


  CourseWidget({this.course});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/video-course', arguments: course);
      },
      color: Constant.bgColorCourse,
      child: CourseVertical(course),
    );
  }
}
