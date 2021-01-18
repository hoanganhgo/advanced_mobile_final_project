import 'package:advanced_mobile_final_project/business/service/lesson-service.dart';
import 'package:flutter/material.dart';

class ListLesson extends StatelessWidget{
  String courseId;

  ListLesson(this.courseId);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List<Widget>>(
        future: LessonService.getListLesson(courseId),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if( snapshot.connectionState == ConnectionState.waiting){
            return  Center(child: Text('Please wait its loading...'));
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