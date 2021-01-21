import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class AuthorVertical extends StatelessWidget {
  AuthorModel model;
  AuthorVertical(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/author-detail', arguments: this.model);
        },
        color: Constant.bgColorCourse,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(this.model.avatar),
              radius: 40.0,
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
                Text(this.model.numberOfCourses.toString() + " " + S.current.courses,
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
            child: AuthorVertical(author))
      );
    }
    return result;
  }
}