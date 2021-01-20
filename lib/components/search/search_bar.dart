import 'package:advanced_mobile_final_project/business/service/search_service.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends PreferredSize {
  final String name;
  final double height;
  final List<String> list = List.generate(10, (index) => 'Text $index');

  SearchBar({this.height = kToolbarHeight, this.name});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    return AppBar(
      title: Text(this.name),
      backgroundColor: store.primaryColor,
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