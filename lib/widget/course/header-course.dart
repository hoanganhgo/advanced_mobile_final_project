import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';

class HeaderCourse extends StatelessWidget {
  String title;
  Function seeMore;

  HeaderCourse({this.title = "", this.seeMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(this.title,
          style: TextStyle(
            fontSize: Constant.titleCourseSize,
            fontWeight: Constant.titleCourseWeight,
          ),
        ),
        InkWell(
          child: Text(
            S.current.see_all + ' >',
            style: TextStyle(
              color: Colors.black,
              fontSize: Constant.seeAllSize,
            ),
          ),
          onTap: this.seeMore
        ),
      ],
    );
  }
}
