import 'package:advanced_mobile_final_project/model/comment-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentWidget extends StatelessWidget {
  CommentModel model;

  CommentWidget(this.model);

  String compact(String text) {
    if (text.length > 20) {
      return text.substring(0, 20) + '...';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(model.avatar),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                    child: Text(compact(model.name),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),),
                  ),

                ],
              ),
              RatingBar.builder(
                initialRating: model.star,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 1,
                )
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 10, 5),
            height: 35,
            width: MediaQuery.of(context).copyWith().size.height - 310,
            color: Colors.white,
            child: Text(model.content,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true),
          )
        ],
      ),
    );
  }
}
