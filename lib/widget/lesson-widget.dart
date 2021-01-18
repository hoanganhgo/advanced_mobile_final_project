import 'package:advanced_mobile_final_project/model/lesson-model.dart';
import 'package:flutter/material.dart';

class LessonWidget extends StatelessWidget {
  LessonModel model;

  LessonWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton(
        color: Colors.grey.shade100,
        onPressed: () {

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lesson: " + this.model.name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              )
            ),
            Text("Video: " + this.model.videoName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: true
            ),
            Text("Hours: " + this.model.hours.toString() + "h")
          ],
        ),
      ),
    );
  }
}
