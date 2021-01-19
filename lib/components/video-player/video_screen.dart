import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/ui/course-bar.dart';
import 'package:advanced_mobile_final_project/ui/course-expand.dart';
import 'package:advanced_mobile_final_project/ui/video-player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  CourseModel model;
  VideoPlayerScreen({Key key, this.model}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(model: this.model);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  YoutubePlayerController _controllerYoutube;
  String videoId;

  CourseModel model;
  _VideoPlayerScreenState({this.model});

  @override
  void initState() {
    //Player video mp4
    print("===========> "+this.model.videoLink);

    _controller = VideoPlayerController.network(this.model.videoLink);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);

    //Player video youtube
    this.videoId = YoutubePlayer.convertUrlToId(this.model.videoLink);
    print(videoId); // BBAyRBTfsOU

    if (videoId != null) {
      _controllerYoutube = YoutubePlayerController(
        initialVideoId: this.videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  Widget getVideoPlayer() {
    if (this.videoId == null) {
      return VideoPlayerUI(_controller, _initializeVideoPlayerFuture);
    } else {
      return YoutubePlayer(
        controller: _controllerYoutube,
        showVideoProgressIndicator: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: ListView(
                children: [
                  this.getVideoPlayer(),
                  Text(this.model.courseName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: 5),
                  CourseBar(model),
                  Divider(height: 5),
                  CourseExpand(this.model)
                ]
            )
        ),
    );
  }
}