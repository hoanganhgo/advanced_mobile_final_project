import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/constant/list-courses-type.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCourseFavor extends StatelessWidget {

  ListCourseFavor();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    if (store.user == null) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          height: 50,
          child: Text("Please Sign in to watch this content",
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
        future: CourseService.getFavoriteCourses(store.user.token),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if( snapshot.connectionState == ConnectionState.waiting){
            return  Center(child: Text('Please wait its loading...'));
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
