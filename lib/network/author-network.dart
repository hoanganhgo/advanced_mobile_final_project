import 'dart:convert';

import 'package:advanced_mobile_final_project/business/adapter/mapping.dart';
import 'package:advanced_mobile_final_project/constant/api.dart';
import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:http/http.dart' as http;

class AuthorNetwork {
  static Future<List> searchAuthors(String keyword, int limit, int page) async {
    int offset = (page - 1) * limit;
    var response = await http.post(API.SEARCH_COURSES, body: {
      "keyword": keyword,
      "limit": limit.toString(),
      "offset": offset.toString()
    });

    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> list = json['payload']["instructors"]["data"];

    List<AuthorModel> data = new List();

    list.forEach((course) {
      data.add(Mapping.mapToAuthorModel(course));
    });

    return data;
  }
}