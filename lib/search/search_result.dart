import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/search/search.dart';
import 'package:advanced_mobile_final_project/share/author/author_horizontal.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  List<AuthorModel> authors = [
    new AuthorModel(name: 'John', imageLink: 'assets/images/avatar.jpg', numberOfCourses: 23),
    new AuthorModel(name: 'Peter', imageLink: 'assets/images/avatar.jpg', numberOfCourses: 23),
    new AuthorModel(name: 'Jessica', imageLink: 'assets/images/avatar.jpg', numberOfCourses: 23),
    new AuthorModel(name: 'Lina', imageLink: 'assets/images/avatar.jpg', numberOfCourses: 23),
  ];

  @override
  Widget build(BuildContext context) {
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
            Search(),
            Search(),
            ListView(
              scrollDirection: Axis.vertical,
              children: AuthorHorizontal.getAllAuthors(this.authors),
            ),
          ],
        ),
      ),
    );
  }
}
