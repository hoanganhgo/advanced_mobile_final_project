import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:provider/provider.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';

class SeeMoreRecommend extends StatelessWidget{
  String id;
  SeeMoreRecommend({this.id});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    Map args = ModalRoute.of(context).settings.arguments;
    this.id = args['id'];

    return Scaffold(
      appBar: AppBarCustom(name: S.current.recommend, avatar: store.avatar),
      body: FutureBuilder<List<Widget>>(
        future: CourseService.getRecommendCoursesMore(id),
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