import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/business/share/other/app_bar.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SeeMoreRecommend extends StatelessWidget{
  String id;
  SeeMoreRecommend({this.id});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    Map args = ModalRoute.of(context).settings.arguments;
    this.id = args['id'];

    return Scaffold(
      appBar: AppBarCustom(name: "Recommend for you", avatar: store.avatar),
      body: FutureBuilder<List<Widget>>(
        future: CourseService.getRecommendCoursesMore(id),
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