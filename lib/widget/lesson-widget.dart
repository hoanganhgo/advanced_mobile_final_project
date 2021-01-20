import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/lesson-model.dart';
import 'package:advanced_mobile_final_project/widget/alert-dialog.dart';
import 'package:flutter/material.dart';

class LessonWidget extends StatelessWidget {
  CourseModel courseModel;
  LessonModel model;

  LessonWidget(this.model, this.courseModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton(
        color: Colors.grey.shade100,
        onPressed: () {
          // if (model.videoUrl.isEmpty) {
          //   AlertDialogBasic(title: "Lesson", content: "Video is invalid", actions: [
          //     FlatButton(onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     child: Text("OK"))
          //   ]).show(context);
          //   return;
          // }
          Navigator.pop(context);
          this.courseModel.videoLink = model.videoUrl;
          Navigator.pushNamed(context, '/video-course', arguments: {
            'course': this.courseModel,
            'exercise': model.id
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lesson: " + this.model.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: true,
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
