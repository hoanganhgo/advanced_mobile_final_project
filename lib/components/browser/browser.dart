import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/ui/author/author.dart';
import 'package:advanced_mobile_final_project/ui/list-category.dart';
import 'package:advanced_mobile_final_project/ui/list-course-favor.dart';
import 'package:advanced_mobile_final_project/ui/list-course-recommend.dart';
import 'package:advanced_mobile_final_project/widget/header-course.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Browser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BrowserState();
  }
}

class _BrowserState extends State<StatefulWidget> {
  String id;
  Function seeMore;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    if (store.user == null) {
      setState(() {
        this.id = "";
        this.seeMore = () {

        };
      });
    } else {
      setState(() {
        this.id = store.user.id;
        this.seeMore = () {
          Navigator.pushNamed(context, '/see-more-recommend', arguments: {
            'id': this.id,
          });
        };
      });
    }

    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: ListView(
        children: [
          HeaderCourse(title: "Recommend for you", seeMore: this.seeMore),
          ListCourseRecommend(this.id),
          Divider(),
          HeaderCourse(title: "Favorite Course", seeMore: () {}),
          ListCourseFavor(),
          Text('Category',
            style: TextStyle(
              fontSize: Constant.titleCourseSize,
              fontWeight: Constant.titleCourseWeight,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 150,
            child: ListCategory(),
          ),
          Divider(),
          Text('Top Authors',
            style: TextStyle(
              fontSize: Constant.titleCourseSize,
              fontWeight: Constant.titleCourseWeight,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: Author.getAllAuthors(store.getAllAuthors()),
            ),
          )
        ],
      ),
    );
  }
}