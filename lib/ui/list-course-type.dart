import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/business/share/other/app_bar.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ListCourseType extends StatelessWidget{
  String id;
  String name;
  ListCourseType({this.id, this.name});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    Map args = ModalRoute.of(context).settings.arguments;
    this.id = args['id'];
    this.name = args['name'];

    return Scaffold(
      appBar: AppBarCustom(name: this.name, avatar: store.avatar),
      body: FutureBuilder<List<Widget>>(
        future: CourseService.getCourseByType(id),
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