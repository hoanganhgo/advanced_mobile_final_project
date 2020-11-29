import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:advanced_mobile_final_project/share/author/author.dart';
import 'package:advanced_mobile_final_project/share/other/category.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:advanced_mobile_final_project/widget/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Browser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BrowserState();
  }
}

class _BrowserState extends State<StatefulWidget> {
  List<AuthorModel> authors = [
    new AuthorModel(name: 'John', imageLink: 'assets/images/avatar.jpg'),
    new AuthorModel(name: 'Peter', imageLink: 'assets/images/avatar.jpg'),
    new AuthorModel(name: 'Jessica', imageLink: 'assets/images/avatar.jpg'),
    new AuthorModel(name: 'Lina', imageLink: 'assets/images/avatar.jpg'),
  ];

  List<CategoryModel> categories = [
    new CategoryModel(name: 'Software', imageLink: 'assets/images/csharp.jpg'),
    new CategoryModel(name: 'Software', imageLink: 'assets/images/csharp.jpg'),
    new CategoryModel(name: 'Software', imageLink: 'assets/images/csharp.jpg'),
    new CategoryModel(name: 'Software', imageLink: 'assets/images/csharp.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyLargeButton(icon: Icons.new_releases, text: 'TOP NEW COURSE', color: Colors.black87),
          MyLargeButton(icon: Icons.shopping_bag, text: 'TOP SELL', color: Colors.black87),
          MyLargeButton(icon: Icons.star, text: 'TOP RATING', color: Colors.black87),
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
              children: Category.getAllCategories(this.categories)
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
              children: Author.getAllAuthors(this.authors),
            ),
          )
        ],
      ),
    );
  }
}