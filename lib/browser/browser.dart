import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/service/course_service.dart';
import 'package:advanced_mobile_final_project/share/author/author.dart';
import 'package:advanced_mobile_final_project/share/other/category.dart';
import 'package:advanced_mobile_final_project/widget/my_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Browser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BrowserState();
  }
}

class _BrowserState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyLargeButton(icon: Icons.new_releases, text: 'TOP NEW COURSE', color: Colors.black87,
            event: () {
              Navigator.pushNamed(context, '/list-course', arguments: {
                'name': 'Top New Course',
                'filter': 'top-new'
              });
            }),
          MyLargeButton(icon: Icons.shopping_bag, text: 'TOP SELL', color: Colors.black87,
              event: () {
                Navigator.pushNamed(context, '/list-course', arguments: {
                  'name': 'Top Sell',
                  'filter': 'top-sell'
                });
              }),
          MyLargeButton(icon: Icons.star, text: 'TOP RATING', color: Colors.black87,
              event: () {
                Navigator.pushNamed(context, '/list-course', arguments: {
                  'name': 'Top Rating',
                  'filter': 'top-rate'
                });
              }),
          Divider(),
          Text('Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
          SizedBox(height: 5),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: Category.getAllCategories(store.getAllCategories())
            ),
          ),
          Divider(),
          Text('Top Authors',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
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