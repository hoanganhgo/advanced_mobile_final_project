import 'package:advanced_mobile_final_project/constant/category-type.dart';
import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:advanced_mobile_final_project/model/comment-model.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/exercise-model.dart';
import 'package:advanced_mobile_final_project/model/lesson-model.dart';

class Mapping {
  static CourseModel mapToCourseModel(dynamic json) {
    var id = json['id'];
    var requirement = json['requirement'] == null ? 'None' : json['requirement'][0];
    var imageLink = json['imageUrl'] == null ? "Empty" : json["imageUrl"];
    var videoLink = json['promoVidUrl'] == null ? "" : json['promoVidUrl'];
    var courseName = json['title'] == null ? "Unknown" : json['title'];
    var authorName = json['instructor.user.name'] == null ? "Unknown" : json['instructor.user.name'];
    var updateAt = json['updatedAt'];
    updateAt = updateAt == null ? DateTime.now() : DateTime.parse(updateAt);
    var rates = (json['ratedNumber']);
    var description = json['description'] == null ? "" : json['description'];
    var totalHours = (json['totalHours'] == null ? 0.0 : json['totalHours'])  + 0.0;
    var learnWhat = json["learnWhat"];
    description = description + "\n" + learnWhat.toString();

    return new CourseModel(id: id, imageLink: imageLink, videoLink: videoLink,
    courseName: courseName, authorName: authorName,requirement: requirement,
    updateAt: updateAt,rates: rates, description: description, totalHours: totalHours);
  }

  static CourseModel mapToCourseModelV2(dynamic json) {
    var id = json['id'];
    var requirement = json['requirement'] == null ? 'None' : json['requirement'][0];
    var imageLink = json['courseImage'] == null ? "Empty" : json["courseImage"];
    var videoLink = json['promoVidUrl'] == null ? "" : json['promoVidUrl'];
    var courseName = json['courseTitle'] == null ? "Unknown" : json['courseTitle'];
    var authorName = json['instructorName'] == null ? "Unknown" : json['instructorName'];
    var updateAt = json['updatedAt'];
    updateAt = updateAt == null ? DateTime.now() : DateTime.parse(updateAt);
    var rates = json['ratedNumber'] == null ? 0 : json['ratedNumber'];
    var description = json['description'] == null ? "" : json['description'];
    var totalHours = (json['totalHours'] == null ? 0.0 : json['totalHours'])  + 0.0;
    var learnWhat = json["learnWhat"];
    description = description + "\n" + learnWhat.toString();

    return new CourseModel(id: id, imageLink: imageLink, videoLink: videoLink,
        courseName: courseName, authorName: authorName,requirement: requirement,
        updateAt: updateAt,rates: rates, description: description, totalHours: totalHours);
  }

  static CourseModel mapToCourseModelForSearch(dynamic json) {
    print(json);
    var id = json['id'];
    // var videoLink = json['promoVidUrl'];
    var imageLink = json['imageUrl'];
    var courseName = json['title'];
    var authorName = json['name'];
    var updateAt = DateTime.parse(json['updatedAt']);
    var rates = json['ratedNumber'];
    var description = json['description'];
    var totalHours = json['totalHours'];

    return new CourseModel(id: id, imageLink: imageLink, courseName: courseName, authorName: authorName,
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

  static LessonModel mapToLessonModel(dynamic json) {
    var id = json["id"];
    var name = json["name"];
    var content = json["content"];
    var videoName = json["videoName"];
    var videoUrl = json["videoUrl"];
    var hours = json["hours"] + 0.0;

    id = id == null ? "" : id;
    name = name == null ? "Unknown" : name;
    content = content == null ? "Empty" : content;
    videoName = videoName == null ? "Unknown" : videoName;
    videoUrl = videoUrl == null ? "" : videoUrl;
    hours = hours == null ? "0" : hours;

    return new LessonModel(id, name, content, videoName, videoUrl, hours);
  }

  static ExerciseModel mapToExerciseModel(dynamic json) {
    var id = json["id"];
    var numberOfQuestion = json["numberQuestion"].toString();
    var title = json["title"];

    return new ExerciseModel(id, numberOfQuestion, title);
  }

  static CommentModel mapToCommentModel(dynamic json) {
    var content = json["content"] == null ? "" : json["content"];
    var avatar = json["user"]["avatar"];
    var name = json["user"]["name"] == null ? "NO_NAME" : json["user"]["name"];
    var star = json["averagePoint"] + 0.0 > 5 ? 5.0 : json["averagePoint"] + 0.0;

    return new CommentModel(name, avatar, star, content);
  }
}