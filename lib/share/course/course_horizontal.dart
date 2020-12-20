import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/service/course_service.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseHorizontal extends StatelessWidget {
  CourseModel model;
  CourseHorizontal(this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
          child: Image(
            image: NetworkImage(this.model.imageLink),
            width: 80,
            height: 80,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 125,
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
            Text(this.model.authorName,
              style: TextStyle(
                  fontSize: Constant.courseTextSize,
                  fontWeight: Constant.courseTextWeight,
                  color: Colors.black
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.updateAt.day.toString() + '/'
                    + model.updateAt.month.toString() +
                    '/' + model.updateAt.year.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: Constant.courseTextWeight,
                      color: Colors.black
                  ),
                ),
                Text('  |  '),
                Text(this.model.requirement,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: Constant.courseTextWeight,
                      color: Colors.black
                  ),
                ),
              ],
            ),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 5,
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
                        fontSize: 13,
                        fontWeight: Constant.courseTextWeight,
                        color: Colors.black
                    )
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  static Future<List<Widget>> getListCourses(List<CourseModel> courses, BuildContext context) async {
    courses = await CourseService.getTopNewCourses();
    List<Widget> result = new List<Container>();
    for (CourseModel course in courses) {
      result.add(
          Container(
            margin: EdgeInsets.all(Constant.insetCourse),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/video-course', arguments: course);
              },
              color: Constant.bgColorCourse,
              child: CourseHorizontal(course),
            ),
          )
      );
    }
    return result;
  }
}