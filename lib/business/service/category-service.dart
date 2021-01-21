import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:advanced_mobile_final_project/network/category-network.dart';
import 'package:advanced_mobile_final_project/widget/category.dart';
import 'package:flutter/material.dart';

class CategoryService {
  static Future<List<Widget>> getAllCategories() async {
    List<CategoryModel> categories = await CategoryNetwork.getAllCategory();

    List<Widget> result = new List();

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