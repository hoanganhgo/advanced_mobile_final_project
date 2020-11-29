import 'package:advanced_mobile_final_project/model/video_model.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VideoCourse extends StatelessWidget {
  VideoModel model;
  List<String> lessons = [
    'java basic',
    'if, for, while',
    'paramater in java',
    'java advanced'
  ];

  VideoCourse() {
    model = new VideoModel(
      name: 'Overview java programming',
      link: 'assets/images/video.jpg',
      hours: 378,
      content: 'this is wonderful lesson this is wonderful lesson this is wonderful lesson this is wonderful lesson this is wonderful lesson this is wonderful lesson',
      stars: 3.5,
      rates: 999
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(this.model.link,
                height: 150,
                width: 266,
              ),
            ),
            Text(this.model.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total hours: ' +
                  (this.model.hours/60).round().toString() + 'h'
                  + (this.model.hours%60).toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                  ),
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
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(' (' + this.model.rates.toString() + ')',
                        style: TextStyle(
                            fontSize: Constant.courseTextSize,
                            fontWeight: Constant.courseTextWeight,
                            color: Colors.black
                        )
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Text('Content',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
              )
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45)
              ),
              child: Text(
                this.model.content,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300
                  )
              ),
            ),
            Divider(),
            Text('Lesson',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                )
            ),
            Container(
              height: MediaQuery.of(context).copyWith().size.height - 360,
              child: ListView.builder(
                itemCount: this.lessons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(this.lessons[index]),
                  );
                },
              ),
            )
          ]
        )
      )
    );
  }

  List<Widget> getAllLessons() {
    List<Widget> result = new List<Widget>();

    for (String lesson in this.lessons) {
      result.add(Text(lesson));
    }
    return result;
  }
}