import 'package:advanced_mobile_final_project/components/search/search_result.dart';
import 'package:advanced_mobile_final_project/widget/alert-dialog.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

class SearchService extends SearchDelegate {
  final List<String> data;
  List<String> history;
  final LocalStorage storage = new LocalStorage('search_history');

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
    if (!history.contains(query) && query.length > 0) {
      history.add(query);
      storage.clear();

      for (var i = 0; i < history.length; i++) {
        storage.setItem(i.toString(), history[i]);
      }
    }

    return SearchResult(searchContent: query);
  }

  List<String> getHistorySearching() {
    List<String> result = new List();
    int i = 0;

    while (storage.getItem(i.toString()) != null) {
      result.add(storage.getItem(i.toString()));
      i++;
    }

    return result;
  }

  List<String> reverseList(List<String> list) {
    List<String> result = new List();

    for (var i = list.length - 1; i >= 0; i--) {
      result.add(list[i]);
    }

    return result;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    this.history = getHistorySearching();
    List<String> suggestionsList = [];
    query.isEmpty
        ? suggestionsList = reverseList(history)
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
          onLongPress: () {
            AlertDialogBasic(title: "History Searching", content: "Do you delete this keyword?",
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  this.history.removeAt(this.history.length - index - 1);
                  storage.clear();

                  for (var i = 0; i < history.length; i++) {
                    print("history: " + history[i]);
                    storage.setItem(i.toString(), history[i]);
                  }

                  Navigator.of(context).pop(); // dismiss dialog
                },
              )
            ]).show(context);
          },
        );
      },
    );
  }

}