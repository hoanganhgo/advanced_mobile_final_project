import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'video_screen.dart';

class CourseDetail extends StatefulWidget {

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {

  @override
  Widget build(BuildContext context) {
    CourseModel model = ModalRoute.of(context).settings.arguments;
    return VideoPlayerScreen(model: model);
  }
}