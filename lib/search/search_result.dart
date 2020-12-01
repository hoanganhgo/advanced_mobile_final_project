import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/search/search.dart';
import 'package:advanced_mobile_final_project/share/author/author_horizontal.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
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
            Search(searchContent: '1'),
            Search(searchContent: '2'),
            ListView(
              scrollDirection: Axis.vertical,
              children: AuthorHorizontal.getAllAuthors(store.getAllAuthors()),
            ),
          ],
        ),
      ),
    );
  }
}
