import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  CategoryModel model;
  Category(this.model);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {

        },
        child: Column(
          children: [
            Image(
              height: 80,
              image: AssetImage(this.model.imageLink)
            ),
            Text(this.model.name,
            overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        )
    );
  }

  static List<Widget> getAllCategories(List<CategoryModel> categories) {
    List<Widget> result = new List<Widget>();

    for (CategoryModel category in categories) {
      result.add(
        Container(
          child: Category(category)
        )
      );
    }
    return result;
  }
}
