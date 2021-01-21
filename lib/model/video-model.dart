class VideoModel {
  String id;
  String title;
  String path;

  VideoModel(this.id, this.title, this.path);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'path': path,
    };
  }
}