import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/constant/list-courses-type.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';

class ListMyCourseVertical extends StatelessWidget{
  String name;
  ListMyCourseVertical({this.name});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    if (this.name == null) {
      Map args = ModalRoute.of(context).settings.arguments;
      this.name = args['name'];
    }

    if (store.user == null) {
      return Scaffold(
        appBar: AppBarCustom(name: this.name, avatar: store.avatar),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            height: 50,
            child: Text(S.current.request_sign_in,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
              ),),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarCustom(name: this.name, avatar: store.avatar),
      body: FutureBuilder<List<Widget>>(
        future: CourseService.getMyCourses(store.user.token, ListCourseType.LIST_VERTICAL),
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