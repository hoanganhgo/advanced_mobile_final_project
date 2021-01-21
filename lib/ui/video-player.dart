import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerUI extends StatefulWidget {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  VideoPlayerUI(this._controller, this._initializeVideoPlayerFuture);

  @override
  _VideoScreenState createState() => _VideoScreenState(_controller, _initializeVideoPlayerFuture);
}

class _VideoScreenState extends State<VideoPlayerUI> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  _VideoScreenState(this._controller, this._initializeVideoPlayerFuture);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    ),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            height: 200,
          ),
          Container(
            height: 200,
            child: Center(
              child: FlatButton(
                onPressed: () {
                // Wrap the play or pause in a call to `setState`. This ensures the
                // correct icon is shown.
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
                },
                color: Colors.transparent,
                child: Icon(Icons.play_arrow,
                color: _controller.value.isPlaying ? Colors.transparent : Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
