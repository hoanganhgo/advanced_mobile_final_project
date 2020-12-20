import 'package:flutter/cupertino.dart';

class CourseModel {
  String imageLink;
  String courseName;
  String authorName;
  String requirement;
  DateTime updateAt;
  int totalHours = 365;
  double stars = 5;
  int rates;

  CourseModel({this.imageLink, this.courseName, this.authorName, this.requirement,
    this.updateAt, this.stars, this.rates});
}