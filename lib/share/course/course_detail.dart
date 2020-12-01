import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/lesson_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseDetail extends StatelessWidget {
  LessonModel lesson;
  String description = 'This is a wonderful course for dev. Many lessons is basic and easy to understand. '
  + 'you will learn more after the course. Good luck to you!';
  List<String> lessons = [
    'Overview the course',
    'if, for, while',
    'How to use this framework',
    'Introduce Dart programming',
    'Scaffold and Appbar in flutter',
    'How to use color and fonts',
    'Image and asset in flutter',
    'Flutter vs React native',
    'Many widget in flutter',
    'How to use Restful API',
    'Connect to Database',
    'Deploy app'
  ];

  CourseDetail() {
    this.lesson = new LessonModel(hours: 375);
  }

  @override
  Widget build(BuildContext context) {
    CourseModel model = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(model.imageLink,
                height: 150,
                width: 266,
              ),
            ),
            Text(model.courseName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total hours: ' +
                  (this.lesson.hours/60).round().toString() + 'h'
                  + (this.lesson.hours%60).toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                  ),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: model.stars,
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
            ),
            Divider(height: 5),
            Container(
              height: MediaQuery.of(context).copyWith().size.height - 277,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Container(
                      height: 30.0,
                      child: new TabBar(
                        indicatorColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.blue,
                        tabs: [
                          Tab(
                            text: "Description",
                          ),
                          Tab(
                            text: "Lesson",
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45)
                        ),
                        child: Text(
                          this.description,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                            )
                        ),
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
                    ],
                  ),
                ),
              ),
            ),
            Text(''),
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