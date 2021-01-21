import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/constant/list-courses-type.dart';
import 'package:flutter/material.dart';

class ListCourseHorizontal extends StatelessWidget {
  int filter;

  ListCourseHorizontal(this.filter);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: Constant.heightListCourse,
      child: FutureBuilder<List<Widget>>(
        future: CourseService.getListCourses(this.filter, context, ListCourseType.LIST_HORIZONTAL),
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
                scrollDirection: Axis.horizontal,
                children: snapshot.data,
              );  // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        },
      ),
    );
  }
}
