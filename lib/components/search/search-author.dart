import 'package:advanced_mobile_final_project/business/service/author-service.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';

class SearchAuthor extends StatefulWidget {
  SearchAuthor({Key key, this.searchContent}) : super(key: key);

  String searchContent;

  @override
  _SearchAuthorState createState() => _SearchAuthorState(searchContent);
}

class _SearchAuthorState extends State<SearchAuthor> {
  String searchContent;

  _SearchAuthorState(this.searchContent) {
    _loadData();
  }

  int page = 0;
  List<Widget> items = new List();
  bool isLoading = true;
  double fontSize = 0;

  Future _loadData() async {
    page = page + 1;
    // perform fetching data delay
    List<Widget> list = await AuthorService.getAllAuthors(this.searchContent, page);

    // update data and loading status
    setState(() {
      items.addAll(list);
      isLoading = false;

      if (page == 1 && list.isEmpty) {
        fontSize = 18;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(S.current.not_found,
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.grey
          ),
        ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            // ignore: missing_return
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadData();
                  // start loading data
                  setState(() {
                    isLoading = true;
                  });
                }
              },
              child: Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: this.items,
                ),
              )),
        ),
        Container(
          height: isLoading ? 50.0 : 0,
          color: Colors.transparent,
          child: Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}