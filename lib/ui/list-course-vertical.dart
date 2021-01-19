import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'file:///E:/Advanced%20Mobile/advanced_mobile_final_project/lib/ui/app_bar.dart';
import 'package:advanced_mobile_final_project/constant/list-courses-type.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ListCourseVertical extends StatelessWidget{
  String name;
  int filter;
  ListCourseVertical({this.name, this.filter});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    if (this.name == null) {
      Map args = ModalRoute.of(context).settings.arguments;
      this.name = args['name'];
      this.filter = args['filter'];
    }

    return Scaffold(
      appBar: AppBarCustom(name: this.name, avatar: store.avatar),
      body: FutureBuilder<List<Widget>>(
        future: CourseService.getListCourses(this.filter, context, ListCourseType.LIST_VERTICAL, limit: 100),
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