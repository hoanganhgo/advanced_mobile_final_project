import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/share/course/course.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  var courses = [
    new CourseModel(imageLink: 'assets/images/csharp.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', dateTime: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', dateTime: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', dateTime: new DateTime.now(), stars: 4, rates: 1000),
    new CourseModel(imageLink: 'assets/images/java.jpg', courseName: 'Java dev',
        authorName: 'John', level: 'beginner', dateTime: new DateTime.now(), stars: 4, rates: 1000),
  ];

  List<Widget> getListCourses() {
    List<Widget> result = new List<Container>();
    for (int i = 0; i < this.courses.length; i++) {
      result.add(
        Container(
          margin: EdgeInsets.all(Constant.insetCourse),
          child: RaisedButton(
            onPressed: () {
              print('press: ' + i.toString());
            },
            color: Constant.bgColorCourse,
            child: Course(this.courses[i]),
          ),
        )
      );
    }
    return result;
  }

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
        this.headerCourse('Software Development'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: Constant.heightListCourse,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: this.getListCourses()
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
              children: this.getListCourses()
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
              children: this.getListCourses()
          ),
        ),
      ],
    );
  }
}