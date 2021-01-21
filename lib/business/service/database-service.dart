import 'package:advanced_mobile_final_project/model/video-model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Future<Database> getDatabase() async {
    Database database = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Video(id TEXT PRIMARY KEY, title TEXT, path TEXT)",
        );
      },
      version: 1,
    );

    return database;
  }

  static Future<void> saveVideo(VideoModel video, Database database) async {
    await database.insert(
      'Video',
      video.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<VideoModel>> getVideos(Database database) async {
    final List<Map<String, dynamic>> maps = await database.query('Video');

    return List.generate(maps.length, (i) {
      return VideoModel(maps[i]['id'], maps[i]['title'], maps[i]['path']);
    });
  }
}