import 'package:advanced_mobile_final_project/constant/category-type.dart';
import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';

class Mapping {
  static CourseModel mapToCourseModel(dynamic json) {
    var id = json['id'];
    var requirement = json['requirement'] == null ? 'None' : json['requirement'][0];
    var imageLink = json['imageUrl'] == null ? "Empty" : json["imageUrl"];
    var videoLink = json['promoVidUrl'] == null ? "Empty" : json['promoVidUrl'];
    // var videoLink = "https://www.youtube.com/watch?v=r0hjR9GlRZ8";
    var courseName = json['title'] == null ? "Unknown" : json['title'];
    var authorName = json['instructor.user.name'] == null ? "Unknown" : json['instructor.user.name'];
    var updateAt = DateTime.parse(json['updatedAt']);
    var rates = (json['ratedNumber']);
    var description = json['description'];
    var totalHours = json['totalHours'] + 0.0;
    var learnWhat = json["learnWhat"];
    description = description + "\n" + learnWhat.toString();

    return new CourseModel(id: id, imageLink: imageLink, videoLink: videoLink,
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

  static CategoryModel mapToCategoryModel(dynamic json) {
    var id = json["id"];
    var name = json["name"];
    var imagePath = CategoryType.getValue(id);

    return new CategoryModel(id: id, name: name, imagePath: imagePath);
  }
}