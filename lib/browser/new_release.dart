import 'package:advanced_mobile_final_project/share/course.dart';
import 'package:advanced_mobile_final_project/share/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRelease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
          Course(),
        ],
      ),
    );
  }

}