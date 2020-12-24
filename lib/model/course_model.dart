import 'package:flutter/cupertino.dart';

class CourseModel {
  String imageLink;
  String videoLink;
  String description;
  String courseName;
  String authorName;
  String requirement;
  DateTime updateAt;
  double totalHours = 5.0;
  double stars = 5;
  int rates;

  CourseModel({this.imageLink, this.videoLink, this.courseName, this.authorName, this.requirement,
    this.description, this.totalHours, this.updateAt, this.stars, this.rates});
}