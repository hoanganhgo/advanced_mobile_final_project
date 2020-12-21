import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/share/other/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'course_horizontal.dart';

class ListCourse extends StatelessWidget{
  String name;
  String filter;
  ListCourse({this.name, this.filter});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    Map args = ModalRoute.of(context).settings.arguments;
    this.name = args['name'];
    this.filter = args['filter'];

    return Scaffold(
      appBar: AppBarCustom(name: this.name, avatar: store.avatar),
      body: FutureBuilder<List<Widget>>(
        future: CourseHorizontal.getListCourses(this.filter, context),
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