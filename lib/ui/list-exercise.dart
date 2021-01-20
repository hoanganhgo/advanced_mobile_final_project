import 'package:advanced_mobile_final_project/business/service/lesson-service.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/network/lesson-network.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ListExercise extends StatelessWidget{
  String lessonId;

  ListExercise(this.lessonId);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    if (store.user == null || lessonId.isEmpty) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          height: 50,
          child: Text("You have not chosen any lesson yet",
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey
            ),),
        ),
      );
    }

    return Scaffold(
      body: FutureBuilder<List<Widget>>(
        future: LessonService.getListExercise(store.user.token, lessonId),
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