import 'dart:convert';

import 'package:advanced_mobile_final_project/business/adapter/mapping.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryNetwork {
  static Future<List> getAllCategory() async {
    var response = await http.get(API.CATEGORY);

    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> list = json["payload"];

    List<CategoryModel> data = new List();

    list.forEach((category) {
      data.add(Mapping.mapToCategoryModel(category));
    });

    return data;
  }
}