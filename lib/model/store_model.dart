import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:advanced_mobile_final_project/model/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'course_model.dart';

class StoreModel with ChangeNotifier {
  UserModel user;
  ImageProvider avatar = AssetImage('assets/images/none_avatar.jpg');

  List<CategoryModel> _categories = [
    new CategoryModel(name: 'Software Programing', imageLink: 'assets/images/course/csharp.jpg'),
    new CategoryModel(name: 'Machine Learning', imageLink: 'assets/images/course/ai.jpg'),
    new CategoryModel(name: 'Mobile', imageLink: 'assets/images/course/ios.png'),
    new CategoryModel(name: 'Web develop', imageLink: 'assets/images/course/nodejs.png'),
  ];

  List<CourseModel> _courses = [
    new CourseModel(imageLink: 'assets/images/course/csharp.jpg', courseName: 'C# Programming',
        authorName: 'Mark', requirement: 'beginner', updateAt: new DateTime.utc(2019, 12, 2), stars: 4, rates: 1210),
    new CourseModel(imageLink: 'assets/images/course/java.jpg', courseName: 'Java for senior',
        authorName: 'Jack Ma', requirement: 'senior', updateAt: new DateTime.utc(2018, 3, 2), stars: 5, rates: 1700),
    new CourseModel(imageLink: 'assets/images/course/javascript.png', courseName: 'Javascript basic',
        authorName: 'Messi', requirement: 'beginner', updateAt: new DateTime.utc(2017, 9, 12), stars: 4.5, rates: 770),
    new CourseModel(imageLink: 'assets/images/course/flutter.png', courseName: 'Flutter Artist',
        authorName: 'Ronaldo', requirement: 'junior', updateAt: new DateTime.utc(2020, 12, 12), stars: 3.5, rates: 800),
    new CourseModel(imageLink: 'assets/images/course/python.jpg', courseName: 'Python wonderful',
        authorName: 'Bill Gate', requirement: 'beginner', updateAt: new DateTime.utc(2020, 7, 8), stars: 4, rates: 1010),
    new CourseModel(imageLink: 'assets/images/course/cplusplus.jpg', courseName: 'C++ advanced',
        authorName: 'Jess', requirement: 'senior', updateAt: new DateTime.utc(2018, 10, 10), stars: 3, rates: 1200),
    new CourseModel(imageLink: 'assets/images/course/react.jpg', courseName: 'React Native for beginner',
        authorName: 'Elon Musk', requirement: 'beginner', updateAt: new DateTime.utc(2015, 5, 1), stars: 5, rates: 2000),
    new CourseModel(imageLink: 'assets/images/course/java.jpg', courseName: 'Java OOP',
        authorName: 'Bill Gate', requirement: 'junior', updateAt: new DateTime.utc(2019, 9, 30), stars: 4, rates: 700),
    new CourseModel(imageLink: 'assets/images/course/ai.jpg', courseName: 'AI and Machine Learning',
        authorName: 'Mark', requirement: 'Senior', updateAt: new DateTime.utc(2019, 3, 21), stars: 4.5, rates: 1220),
    new CourseModel(imageLink: 'assets/images/course/android.jpg', courseName: 'Android develop',
        authorName: 'Kaka', requirement: 'junior', updateAt: new DateTime.utc(2019, 7, 17), stars: 5, rates: 1500),
    new CourseModel(imageLink: 'assets/images/course/data_science.png', courseName: 'Data Science',
        authorName: 'Bill Gate', requirement: 'Senior', updateAt: new DateTime.utc(2018, 8, 8), stars: 4, rates: 600),
    new CourseModel(imageLink: 'assets/images/course/flutter.png', courseName: 'Flutter for Senior',
        authorName: 'Ronaldo', requirement: 'Senior', updateAt: new DateTime.utc(2019, 7, 12), stars: 4.5, rates: 870),
    new CourseModel(imageLink: 'assets/images/course/ios.png', courseName: 'IOS for beginner',
        authorName: 'Elon Musk', requirement: 'beginner', updateAt: new DateTime.utc(2020, 3, 17), stars: 2.5, rates: 810),
    new CourseModel(imageLink: 'assets/images/course/nodejs.png', courseName: 'Web with Nodejs',
        authorName: 'Jess', requirement: 'junior', updateAt: new DateTime.utc(2018, 5, 30), stars: 4, rates: 100),
    new CourseModel(imageLink: 'assets/images/course/react.jpg', courseName: 'React Native',
        authorName: 'Elon Musk', requirement: 'junior', updateAt: new DateTime.utc(2019, 8, 19), stars: 4, rates: 1200),
  ];

  List<AuthorModel> _authors = [
    new AuthorModel(name: 'Hacker', imageLink: 'assets/images/avatar/anonymous.jpg', numberOfCourses: 5),
    new AuthorModel(name: 'Bill Gate', imageLink: 'assets/images/avatar/bill_gate.jpg', numberOfCourses: 15),
    new AuthorModel(name: 'Buffett', imageLink: 'assets/images/avatar/buffett.jpg', numberOfCourses: 7),
    new AuthorModel(name: 'Einstein', imageLink: 'assets/images/avatar/einstein.jpg', numberOfCourses: 21),
    new AuthorModel(name: 'Elon Musk', imageLink: 'assets/images/avatar/elon_musk.jpg', numberOfCourses: 17),
    new AuthorModel(name: 'Jack Ma', imageLink: 'assets/images/avatar/jackma.jpg', numberOfCourses: 12),
    new AuthorModel(name: 'Mark Zuckerberg', imageLink: 'assets/images/avatar/mark_zuckerberg.jpg', numberOfCourses: 35),
    new AuthorModel(name: 'Messi', imageLink: 'assets/images/avatar/messi.jpg', numberOfCourses: 20),
    new AuthorModel(name: 'Ronaldo', imageLink: 'assets/images/avatar/ronaldo.jpg', numberOfCourses: 10),
    new AuthorModel(name: 'Trump', imageLink: 'assets/images/avatar/trump.jpg', numberOfCourses: 8),
  ];

  List<CourseModel> getAllCourses({int type = 0}) {
    if (type == 0) {
      return this._courses;
    }

    if (type == 1) {
      // this._courses.sort((a, b) => b.updateAt.compareTo(a.updateAt));
    }

    if (type == 2) {
      this._courses.sort((a, b) => b.rates.compareTo(a.rates));
    }

    if (type == 3) {
      this._courses.sort((a, b) => b.stars.compareTo(a.stars));
    }

    return this._courses;
  }

  List<CategoryModel> getAllCategories() {
    return this._categories;
  }

  List<AuthorModel> getAllAuthors() {
    return this._authors;
  }
}