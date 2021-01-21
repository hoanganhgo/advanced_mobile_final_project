import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:flutter/material.dart';

import 'course-horizontal.dart';

class CourseHorizontalWidget extends StatelessWidget {
  CourseModel courseModel;

  CourseHorizontalWidget({this.courseModel});

  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/video-course', arguments: {
          'course': this.courseModel,
          'exercise': ''
        });
      },
      color: Constant.bgColorCourse,
      child: CourseHorizontal(this.courseModel),
    );
  }
}
