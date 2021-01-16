import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/network/lesson-network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'course-horizontal.dart';

class CourseHorizontalWidget extends StatelessWidget {
  CourseModel courseModel;

  CourseHorizontalWidget({this.courseModel});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    return RaisedButton(
      onPressed: () {
        LessonNetwork.getListLesson(this.courseModel.id, store.user.id);
        Navigator.pushNamed(context, '/video-course', arguments: this.courseModel);
      },
      color: Constant.bgColorCourse,
      child: CourseHorizontal(this.courseModel),
    );
  }
}
