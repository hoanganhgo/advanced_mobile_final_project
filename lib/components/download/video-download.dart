import 'package:advanced_mobile_final_project/business/service/video-service.dart';
import 'package:advanced_mobile_final_project/constant/constant.dart';
import 'package:advanced_mobile_final_project/model/video-model.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile_final_project/ui/video-player.dart';
import 'package:video_player/video_player.dart';

class VideoDownload extends StatefulWidget {
  @override
  _VideoDownloadState createState() => _VideoDownloadState();
}

class _VideoDownloadState extends State<VideoDownload> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  List<VideoModel> listVideos;
  VideoModel model;
  _VideoDownloadState({this.model});

  void createState() {
    //Player video mp4
    print("===========> " + this.model.path);

    _controller = VideoPlayerController.network(this.model.path);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  List<Widget> getVideosWidget(List<VideoModel> videos) {
    List<Widget> result = new List<Container>();

    for (VideoModel video in videos) {
      result.add(
          Container(
              margin: EdgeInsets.all(Constant.insetCourse),
              child: Container(
                height: 60,
                child: RaisedButton(
                  color: Colors.grey.shade100,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/video-download', arguments: {
                      'model': video,
                      'videos': this.listVideos
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        height: 50,
                        image: AssetImage("assets/images/ic_video.png"),
                      ),
                      SizedBox(width: 5),
                      Text(video.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16
                        ),
                      )
                    ],
                  ),
                ),
              )
          )
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context).settings.arguments;
    this.model = map['model'];
    this.listVideos = map['videos'];

    this.createState();

    return Scaffold(
      body: Container(
          margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoPlayerUI(_controller, _initializeVideoPlayerFuture),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  height: 35,
                  child: Text(this.model.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                ),
                Divider(height: 5),
                Container(
                  height: 420,
                  child: ListView(
                    children: this.getVideosWidget(this.listVideos),
                  )
                )
              ]
          )
      ),
    );
  }
}
