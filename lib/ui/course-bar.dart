import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseBar extends StatelessWidget {
  CourseModel model;

  CourseBar(this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total hours: ' + model.totalHours.toStringAsFixed(2) + 'h',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black
          ),
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
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Text(' (' + model.rates.toString() + ')',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black
                )
            ),
          ],
        ),
        IconButton(
            icon: Icon(Icons.download_outlined),
            onPressed: () {

            }),
      ],
    );
  }
}
