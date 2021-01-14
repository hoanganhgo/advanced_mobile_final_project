import 'package:advanced_mobile_final_project/model/course_model.dart';

class Mapping {
  static CourseModel mapToCourseModel(dynamic json) {
    var requirement = json['requirement'] == null ? 'None' : json['requirement'][0];
    var imageLink = json['imageUrl'];
    var videoLink = json['promoVidUrl'];
    var courseName = json['title'];
    var authorName = json['instructor.user.name'];
    var updateAt = DateTime.parse(json['updatedAt']);
    var rates = json['ratedNumber'];
    var description = json['description'];
    var totalHours = json['totalHours'];

    return new CourseModel(imageLink: imageLink, videoLink: videoLink,
    courseName: courseName, authorName: authorName,requirement: requirement,
    updateAt: updateAt,rates: rates, description: description, totalHours: totalHours);
  }
}