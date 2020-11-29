import 'package:advanced_mobile_final_project/main.dart';
import 'package:advanced_mobile_final_project/search/search.dart';
import 'package:advanced_mobile_final_project/search/search_result.dart';
import 'package:flutter/material.dart';

class SearchService extends SearchDelegate {
  final List<String> data;
  SearchService({this.data});

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  String selectedResult;

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult();
  }

  List<String> recentList = ['java', 'flutter'];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionsList = [];
    query.isEmpty
        ? suggestionsList = recentList
        : suggestionsList.addAll(data.where(
            (element) => element.contains(query)
    ));

    return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionsList[index],
          ),
          onTap: () {
            selectedResult = suggestionsList[index];
            query = selectedResult;
            showResults(context);
          },
        );
      },
    );
  }

}