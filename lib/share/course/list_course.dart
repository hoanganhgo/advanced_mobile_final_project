import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/share/other/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'course_horizontal.dart';

class ListCourse extends StatelessWidget{
  String name;
  List<CourseModel> data;
  ListCourse({this.name, this.data});

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    this.name = args['name'];
    this.data = args['data'];

    return Scaffold(
      appBar: AppBarCustom(name: this.name),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: CourseHorizontal.getListCourses(this.data, context)
      ),
    );
  }

}