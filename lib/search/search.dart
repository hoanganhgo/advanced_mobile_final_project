import 'package:advanced_mobile_final_project/share/video.dart';
import 'package:advanced_mobile_final_project/share/video_horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              width: 500,
              height: 600,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                  Container(
                    width: 180.0,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: VideoHorizontal(),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }

}