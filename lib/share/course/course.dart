import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Course extends StatelessWidget {
  CourseModel model;
  Course(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(model.imageLink,
          height: 150,
          width: 210,
        ),
        Container(
          width: 200,
          child: Text(this.model.courseName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: true,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
        ),
        Text(model.authorName,
          style: TextStyle(
              fontSize: Constant.courseTextSize,
              fontWeight: Constant.courseTextWeight,
              color: Colors.black
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model.level,
              style: TextStyle(
                  fontSize: Constant.courseTextSize,
                  fontWeight: Constant.courseTextWeight,
                  color: Colors.black
              ),
            ),
            Text(' - '),
            Text(model.date.day.toString() + '/'
                + model.date.month.toString() +
                '/' + model.date.year.toString(),
              style: TextStyle(
                  fontSize: Constant.courseTextSize,
                  fontWeight: Constant.courseTextWeight,
                  color: Colors.black
              ),
            ),
            Text(' - '),
            Text((model.totalHours/60).round().toString() + 'h'
              + (model.totalHours%60).round().toString(),
              style: TextStyle(
                  fontSize: Constant.courseTextSize,
                  fontWeight: Constant.courseTextWeight,
                  color: Colors.black
              ),
            ),
          ],
        ),
        Row(
          children: [
            RatingBar.builder(
              initialRating: this.model.stars,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
                size: 1,
              ),
              // onRatingUpdate: (rating) {
              //   print(rating);
              // },
            ),
            Text(' (' + this.model.rates.toString() + ')',
              style: TextStyle(
                  fontSize: Constant.courseTextSize,
                  fontWeight: Constant.courseTextWeight,
                  color: Colors.black
              )
            ),
          ],
        )
      ],
    );
  }

  static List<Widget> getListCourses(List<CourseModel> courses, BuildContext context) {
    List<Widget> result = new List<Container>();
    for (CourseModel course in courses) {
      result.add(
          Container(
            margin: EdgeInsets.all(Constant.insetCourse),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/video-course');
              },
              color: Constant.bgColorCourse,
              child: Course(course),
            ),
          )
      );
    }
    return result;
  }

}