import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  AuthorModel model;
  Author(this.model);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/author-detail', arguments: this.model);
        },
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(this.model.imageLink),
              radius: 32.0,
            ),
            Text(this.model.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        )
    );
  }

  static List<Widget> getAllAuthors(List<AuthorModel> authors) {
    List<Widget> result = new List<Widget>();

    for (AuthorModel author in authors) {
        result.add(
          Container(
            width: 100,
            child: Author(author))
        );
    }
    return result;
  }
}