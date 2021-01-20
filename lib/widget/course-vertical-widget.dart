import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/network/course-network.dart';
import 'package:flutter/material.dart';

import 'course_vertical.dart';

class CourseVerticalWidget extends StatelessWidget {
  CourseModel course;

  CourseVerticalWidget({this.course});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        print("press widget:" + this.course.id);
        this.course = await CourseNetwork.getCourseDetail(this.course.id);
        Navigator.pushNamed(context, '/video-course', arguments: {
          'course': course,
          'exercise': ""
        });
      },
      color: Constant.bgColorCourse,
      child: CourseVertical(course),
    );
  }
}
