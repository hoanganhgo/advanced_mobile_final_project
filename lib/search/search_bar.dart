import 'package:advanced_mobile_final_project/service/search_service.dart';
import 'package:advanced_mobile_final_project/share/other/constant.dart';
import 'package:flutter/material.dart';

class SearchBar extends PreferredSize {
  final String name;
  final double height;
  final List<String> list = List.generate(10, (index) => 'Text $index');

  SearchBar({this.height = kToolbarHeight, this.name});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.name),
      backgroundColor: Constant.primaryColor,
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context,
                  delegate: SearchService(
                    data: this.list
                  ));
            })
      ],
    );
  }
}