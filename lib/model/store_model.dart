import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/category_model.dart';
import 'package:advanced_mobile_final_project/model/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'course_model.dart';

class StoreModel with ChangeNotifier {
  UserModel user;
  ImageProvider avatar = AssetImage('assets/images/none_avatar.jpg');

  List<AuthorModel> _authors = [
    new AuthorModel(name: 'Hacker', avatar: 'assets/images/avatar/anonymous.jpg', numberOfCourses: 5),
    new AuthorModel(name: 'Bill Gate', avatar: 'assets/images/avatar/bill_gate.jpg', numberOfCourses: 15),
    new AuthorModel(name: 'Buffett', avatar: 'assets/images/avatar/buffett.jpg', numberOfCourses: 7),
    new AuthorModel(name: 'Einstein', avatar: 'assets/images/avatar/einstein.jpg', numberOfCourses: 21),
    new AuthorModel(name: 'Elon Musk', avatar: 'assets/images/avatar/elon_musk.jpg', numberOfCourses: 17),
    new AuthorModel(name: 'Jack Ma', avatar: 'assets/images/avatar/jackma.jpg', numberOfCourses: 12),
    new AuthorModel(name: 'Mark Zuckerberg', avatar: 'assets/images/avatar/mark_zuckerberg.jpg', numberOfCourses: 35),
    new AuthorModel(name: 'Messi', avatar: 'assets/images/avatar/messi.jpg', numberOfCourses: 20),
    new AuthorModel(name: 'Ronaldo', avatar: 'assets/images/avatar/ronaldo.jpg', numberOfCourses: 10),
    new AuthorModel(name: 'Trump', avatar: 'assets/images/avatar/trump.jpg', numberOfCourses: 8),
  ];

  List<AuthorModel> getAllAuthors() {
    return this._authors;
  }
}