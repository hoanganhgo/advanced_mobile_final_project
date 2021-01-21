import 'dart:io';

import 'package:advanced_mobile_final_project/business/service/database-service.dart';
import 'package:advanced_mobile_final_project/model/comment-model.dart';
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
import 'package:share/share.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';

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
  Color like;

  _CourseBarState(this.model);

  var dio = Dio();
  double percent = 0;
  var editComment = new TextEditingController();
  double starRating = 0.0;

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

    if (like == null && store.user != null) {
      if (store.myFavors.contains(model.id) || model.like) {
        if (!store.myFavors.contains(model.id)) {
          store.myFavors.add(model.id);
        }

        like = Colors.red;
      } else {
        like = Colors.black87;
      }
    } else if (store.user == null) {
      like = Colors.black87;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Column(
            children: [
              Text(S.current.hours + model.sumFinish.toStringAsFixed(2) + "h/"
                  + model.totalHours.toStringAsFixed(2) + 'h',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black
                ),
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: model.getStar(),
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 1,
                    )
                  ),
                  Text(' (' + model.rates.toString() + ')',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black
                      )
                  ),
                ],
              )
            ],
          ),
            FlatButton(
              minWidth: 120,
              color: Colors.transparent,
              onPressed: () {
                if (store.user == null) {
                  AlertDialogBasic(title: S.current.message, content: S.current.notify_rating
                      , actions: [
                        FlatButton(onPressed: () {
                          Navigator.pop(context);
                        },
                            child: Text(S.current.btn_ok))
                      ]).show(context);
                  return;
                }

                var ratingAlert = AlertDialog(
                  title: Text(S.current.comment),
                  content: Container(
                    height: 210,
                    child: Column(
                      children: [
                        RatingBar.builder(
                          initialRating: model.getStar(),
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 30,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 1,
                          ),
                          onRatingUpdate: (rating) {
                            this.starRating = rating;
                          },
                        ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.grey.shade100,
                          height: 100,
                          child: TextField(
                            maxLines: 5,
                            obscureText: false,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            controller: this.editComment,
                          ),
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          color: Colors.grey.shade200,
                            onPressed: () async {
                              //print("RATE:>>"+rating.toString());
                              await CourseNetwork.rateCourse(store.user.token, model.id,
                                  this.starRating, this.editComment.text);

                              setState(() {
                                var has = false;
                                for (CommentModel comment in model.comments) {
                                  if (comment.name == store.user.name) {
                                    comment.star = this.starRating;
                                    comment.content = this.editComment.text;
                                    has = true;
                                    break;
                                  }
                                }

                                if (!has) {
                                  model.comments.add(new CommentModel(store.user.name,
                                      store.user.avatar, this.starRating, this.editComment.text));
                                }
                              });

                              Navigator.pop(context);
                            },
                            child: Text(S.current.send,
                              style: TextStyle(
                                fontSize: 18,
                              ),))
                      ],
                    ),
                  ),
                );

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ratingAlert;
                  },
                );
              }
            )
          ]
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share(model.videoLink);
                }),
            Stack(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: like,
                    ),
                    onPressed: () async {
                      if (store.user == null) {
                        AlertDialogBasic(title: S.current.message, content: S.current.notify_like
                            , actions: [
                              FlatButton(onPressed: () {
                                Navigator.pop(context);
                              },
                                  child: Text(S.current.btn_ok))
                            ]).show(context);
                        return;
                      }

                      setState(() {
                        if (like == Colors.black87) {
                          like = Colors.red;
                        } else {
                          like = Colors.black87;
                        }
                      });

                      await CourseNetwork.likeCourse(store.user.token, model.id);

                      if (await CourseNetwork.statusLikeCourse(store.user.token, model.id)) {
                        store.myFavors.add(model.id);
                      } else {
                        store.myFavors.remove(model.id);
                      }
                    })
              ],
            ),
            Stack(
              children: [
                IconButton(
                    icon: Icon(Icons.check_box),
                    onPressed: () async {
                      if (store.user == null) {
                        AlertDialogBasic(title: S.current.message, content: S.current.notify_register
                            , actions: [
                              FlatButton(onPressed: () {
                                Navigator.pop(context);
                              },
                                  child: Text(S.current.btn_ok))
                            ]).show(context);
                        return;
                      }

                      bool status = await CourseNetwork.registerCourse(store.user.token, model.id);

                      String message = "";
                      if (status) {
                        message = S.current.register_success;
                      } else {
                        message = S.current.already_subscribe;
                      }

                      AlertDialogBasic(title: S.current.message, content: message, actions: [
                        FlatButton(onPressed: () {
                          Navigator.pop(context);
                        },
                            child: Text(S.current.btn_ok))
                      ]).show(context);
                    }),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 34, 0, 0),
                  child: Text(S.current.subscribe,
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
                      //print("Link:"+this.model.videoLink);
                      //print('full path:${fullPath}');

                      downloadVideo(dio, this.model.videoLink, fullPath);

                      //write database
                      final Database database = await DatabaseService.getDatabase();
                      final video = VideoModel(this.model.id, this.model.courseName, fullPath);
                      await DatabaseService.saveVideo(video, database);

                    }),
              ],
            )
          ],
        )
      ],
    );
  }
}
