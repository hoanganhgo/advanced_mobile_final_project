import 'package:advanced_mobile_final_project/model/comment-model.dart';

class CourseModel {
  String id;
  String imageLink;
  String videoLink;
  String description;
  String courseName ;
  String authorName;
  String requirement;
  DateTime updateAt;
  double totalHours = 5;
  double stars = 5;
  int rates = 0;
  int soldNumber = 0;
  int videoNumber = 0;
  List<CommentModel> comments;
  double sumFinish;
  bool like = false;

  CourseModel({this.id, this.imageLink, this.videoLink, this.courseName, this.authorName, this.requirement,
    this.description, this.totalHours, this.updateAt, this.stars, this.rates, this.soldNumber, this.videoNumber,
  this.comments, this.sumFinish});

  double getStar() {
    double star = 0;
    if (comments == null) {
      return star;
    }

    if (comments.length == 0) {
      return star;
    }

    comments.forEach((comment) {
      star += comment.star;
    });

    return star / comments.length;
  }
}