import 'package:advanced_mobile_final_project/business/service/course-service.dart';
import 'package:advanced_mobile_final_project/model/comment-model.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class ListComment extends StatelessWidget{
  List<CommentModel> comments;

  ListComment(this.comments);

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          height: 50,
          child: Text(S.current.comment_empty,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey
            ),),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: CourseService.getListComments(comments),
      )
    );
  }

}