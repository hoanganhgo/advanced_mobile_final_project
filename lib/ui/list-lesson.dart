import 'package:advanced_mobile_final_project/business/service/lesson-service.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:flutter/material.dart';

class ListLesson extends StatelessWidget{
  CourseModel courseModel;

  ListLesson(this.courseModel);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List<Widget>>(
        future: LessonService.getListLesson(courseModel),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if( snapshot.connectionState == ConnectionState.waiting){
            return  Center(
                child: Container(
                  height: 50.0,
                  color: Colors.transparent,
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ),
                )
            );
          }else{
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data,
              );  // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        },
        //children: CourseHorizontal.getListCourses(this.data, context)
      ),
    );
  }

}