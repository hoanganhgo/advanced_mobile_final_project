import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/share/course/course_horizontal.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  String searchContent = '0';
  Search({this.searchContent});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    return ListView(
        scrollDirection: Axis.vertical,
        //children: CourseHorizontal.getListCourses(store.getAllCourses(type: int.parse(this.searchContent)), context)
    );
  }
}