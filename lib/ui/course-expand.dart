import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/ui/list-exercise.dart';
import 'package:flutter/material.dart';

import 'list-lesson.dart';

class CourseExpand extends StatelessWidget {
  CourseModel model;
  String lessonId;

  CourseExpand(this.model, {this.lessonId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height - 277,
      child: DefaultTabController(
        length: 3,
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
                  Tab(
                    text: "Exercise",
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
                    model.description,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300
                    )
                ),
              ),
              Container(
                  height: MediaQuery.of(context).copyWith().size.height - 360,
                  child: ListLesson(model)
              ),
              Container(
                  height: MediaQuery.of(context).copyWith().size.height - 360,
                  child: ListExercise(lessonId)
              )
            ],
          ),
        ),
      ),
    );
  }
}
