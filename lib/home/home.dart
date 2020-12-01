import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/share/course/course.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
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
    final store = Provider.of<StoreModel>(context);

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        this.headerCourse('Software Development'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: Constant.heightListCourse,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: Course.getListCourses(store.getAllCourses(), context)
          ),
        ),
        Divider(),
        this.headerCourse('IT Operations'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: Constant.heightListCourse,
          child: ListView(
            // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: Course.getListCourses(store.getAllCourses(type: 1), context)
          ),
        ),
        Divider(),
        this.headerCourse('Data Professional'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: Constant.heightListCourse,
          child: ListView(
            // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: Course.getListCourses(store.getAllCourses(type: 2), context)
          ),
        ),
      ],
    );
  }
}