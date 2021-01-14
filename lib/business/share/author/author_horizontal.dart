import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorHorizontal extends StatelessWidget {
  AuthorModel model;
  AuthorHorizontal(this.model);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/author-detail', arguments: this.model);
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(this.model.imageLink),
              radius: 25.0,
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.model.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(this.model.numberOfCourses.toString() + ' courses',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ],
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
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: AuthorHorizontal(author))
      );
    }
    return result;
  }
}