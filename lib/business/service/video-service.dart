import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/video-model.dart';
import 'package:advanced_mobile_final_project/widget/video-widget.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'database-service.dart';

class VideoService {
  static Future<List<Widget>> getVideos() async {
    Database database = await DatabaseService.getDatabase();
    List<VideoModel> videos = await DatabaseService.getVideos(database);
    return VideoService.getVideosWidget(videos);
  }

  static List<Widget> getVideosWidget(List<VideoModel> videos) {
    List<Widget> result = new List<Container>();

    for (VideoModel video in videos) {
      result.add(
          Container(
              margin: EdgeInsets.all(Constant.insetCourse),
              child: VideoWidget(video, videos)
          )
      );
    }
    return result;
  }
}