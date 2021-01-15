import 'package:advanced_mobile_final_project/components/search/search-all.dart';
import 'package:advanced_mobile_final_project/components/search/search-author.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search-course.dart';

class SearchResult extends StatelessWidget {
  String searchContent;

  SearchResult({this.searchContent});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            height: 50.0,
            child: new TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: [
                Tab(
                  text: "ALL",
                ),
                Tab(
                  text: "COURSES",
                ),
                Tab(
                  text: "AUTHORS",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SearchAll(searchContent: this.searchContent),
            SearchCourse(searchContent: this.searchContent),
            SearchAuthor(searchContent: this.searchContent)
          ],
        ),
      ),
    );
  }
}
