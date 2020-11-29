class CourseModel {
  String imageLink;
  String courseName;
  String authorName;
  String level;
  DateTime date;
  int totalHours = 365;
  double stars;
  int rates;

  CourseModel({this.imageLink, this.courseName, this.authorName, this.level,
    this.date, this.stars, this.rates});
}