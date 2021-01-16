import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/ui/list-course-vertical.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VideoPlayerScreen extends StatefulWidget {
  CourseModel model;
  VideoPlayerScreen({Key key, this.model}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(model: this.model);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  CourseModel model;
  _VideoPlayerScreenState({this.model});

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(this.model.videoLink);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          child: FutureBuilder(
                            future: _initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                // If the VideoPlayerController has finished initialization, use
                                // the data it provides to limit the aspect ratio of the video.
                                return AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  // Use the VideoPlayer widget to display the video.
                                  child: VideoPlayer(_controller),
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
                          color: Colors.transparent,
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 112),
                          child: FlatButton(onPressed: () {
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
                        )
                      ],
                    ),
                  ),
                  Text(this.model.courseName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total hours: ' + model.totalHours.toStringAsFixed(2) + 'h',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 1,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(' (' + model.rates.toString() + ')',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black
                              )
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.download_outlined),
                          onPressed: () {

                          }),
                    ],
                  ),
                  Divider(height: 5),
                  Container(
                    height: MediaQuery.of(context).copyWith().size.height - 277,
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(kToolbarHeight),
                          child: Container(
                            height: 30.0,
                            child: new TabBar(
                              indicatorColor: Colors.blue,
                              unselectedLabelColor: Colors.grey,
                              labelColor: Colors.blue,
                              tabs: [
                                Tab(
                                  text: "Description",
                                ),
                                Tab(
                                  text: "Lesson",
                                ),
                              ],
                            ),
                          ),
                        ),
                        body: TabBarView(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45)
                              ),
                              child: Text(
                                  model.description,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300
                                  )
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).copyWith().size.height - 360,
                              child: ListCourseVertical(name: "new", filter: 1)
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(''),
                ]
            )
        ),
    );
  }
}