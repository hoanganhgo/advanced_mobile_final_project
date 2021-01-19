import 'package:advanced_mobile_final_project/model/video-model.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  List<VideoModel> listVideos;
  VideoModel model;

  VideoWidget(this.model, this.listVideos);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton(
        color: Colors.grey.shade100,
        onPressed: () {
          Navigator.pushNamed(context, '/video-download', arguments: {
            'model': this.model,
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
            Text(this.model.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }
}
