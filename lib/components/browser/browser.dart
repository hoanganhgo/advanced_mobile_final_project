import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/ui/author/author.dart';
import 'package:advanced_mobile_final_project/ui/course/list-course-favor.dart';
import 'package:advanced_mobile_final_project/ui/course/list-course-recommend.dart';
import 'package:advanced_mobile_final_project/ui/list-category.dart';
import 'package:advanced_mobile_final_project/widget/course/header-course.dart';
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
          HeaderCourse(title: S.current.recommend, seeMore: this.seeMore),
          ListCourseRecommend(this.id),
          Divider(),
          HeaderCourse(title: S.current.favorite, seeMore: () {}),
          ListCourseFavor(),
          Text(S.current.category,
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
          Text(S.current.top_authors,
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