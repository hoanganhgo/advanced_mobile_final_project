import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class ListCourseRecommend extends StatelessWidget {
  String id;

  ListCourseRecommend(this.id);

  @override
  Widget build(BuildContext context) {
    if (this.id.isEmpty) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          height: 50,
          child: Text(S.current.request_sign_in,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey
          ),),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: Constant.heightListCourse,
      child: FutureBuilder<List<Widget>>(
        future: CourseService.getRecommendCourses(this.id),
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
