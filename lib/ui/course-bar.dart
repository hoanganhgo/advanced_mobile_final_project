import 'dart:io';

import 'package:advanced_mobile_final_project/business/service/database-service.dart';
import 'package:advanced_mobile_final_project/model/course_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/model/video-model.dart';
import 'package:advanced_mobile_final_project/network/course-network.dart';
import 'package:advanced_mobile_final_project/widget/alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseBar extends StatefulWidget {
  CourseModel model;

  CourseBar(this.model);

  @override
  _CourseBarState createState() => _CourseBarState(this.model);
}

class _CourseBarState extends State<CourseBar> {
  CourseModel model;

  _CourseBarState(this.model);

  var dio = Dio();
  double percent = 0;

  Future downloadVideo(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);

      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      setState(() {
        this.percent = received / total;
      });

      if (this.percent >= 1) {
        this.percent = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Hours: ' + model.totalHours.toStringAsFixed(2) + 'h',
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
        Stack(
          children: [
            IconButton(
                icon: Icon(Icons.check_box),
                onPressed: () async {
                  CourseNetwork.getCourseRegister(store.user.token);

                  if (store.user == null) {
                    AlertDialogBasic(title: "Message", content: "You must login to register this course"
                        , actions: [
                          FlatButton(onPressed: () {
                            Navigator.pop(context);
                          },
                              child: Text("OK"))
                        ]).show(context);
                    return;
                  }

                  bool status = await CourseNetwork.registerCourse(store.user.token, model.id);

                  String message = "";
                  if (status) {
                    message = "You have successfully registered for the course";
                  } else {
                    message = "You have already signed up for this course";
                  }

                  AlertDialogBasic(title: "Message", content: message, actions: [
                    FlatButton(onPressed: () {
                      Navigator.pop(context);
                    },
                        child: Text("OK"))
                  ]).show(context);
                }),
            Container(
              margin: EdgeInsets.fromLTRB(0, 34, 0, 0),
              child: Text("Subscribe",
              style: TextStyle(
                fontSize: 12
              )),
            )
          ],
        ),
        Stack(
          children: [
            CircularPercentIndicator(
              radius: 49.0,
              lineWidth: 2.0,
              percent: this.percent,
              progressColor: Colors.green,
              backgroundColor: Colors.transparent,
            ),
            IconButton(
                icon: Icon(Icons.download_outlined),
                onPressed: () async {
                  var tempDir = await getApplicationDocumentsDirectory();
                  String fullPath = tempDir.path + "/" + this.model.id + ".mp4";
                  print("Link:"+this.model.videoLink);
                  print('full path:${fullPath}');

                  downloadVideo(dio, this.model.videoLink, fullPath);

                  //write database
                  final Database database = await DatabaseService.getDatabase();
                  final video = VideoModel(this.model.id, this.model.courseName, fullPath);
                  await DatabaseService.saveVideo(video, database);

                }),
          ],
        ),
      ],
    );
  }
}
