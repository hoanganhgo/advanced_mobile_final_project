import 'package:advanced_mobile_final_project/model/author_model.dart';
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

  static CourseModel mapToCourseModelForSearch(dynamic json) {
    var imageLink = json['imageUrl'];
    var courseName = json['title'];
    var authorName = json['name'];
    var updateAt = DateTime.parse(json['updatedAt']);
    var rates = json['ratedNumber'];
    var description = json['description'];
    var totalHours = json['totalHours'];

    return new CourseModel(imageLink: imageLink, courseName: courseName, authorName: authorName,
        requirement: "", updateAt: updateAt,rates: rates, description: description, totalHours: totalHours);
  }

  static AuthorModel mapToAuthorModel(dynamic json) {
    var name = json["name"];
    var avatar = json["avatar"];
    var numberOfCourses = json["numcourses"];
    var numbers = int.tryParse(numberOfCourses);
    if (numbers == null) {
      numbers = 0;
    }

    return new AuthorModel(name: name, avatar: avatar, numberOfCourses: numbers);
  }
}