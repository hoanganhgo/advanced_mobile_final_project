import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyDownload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmptyDownloadState();
  }
}

class _EmptyDownloadState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.file_download,
            color: Colors.grey,
            size: 100,
          ),
          Text(
            'Watch your courses on the go!',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22
            ),
          ),
          Text(
            'Download courses so you can\ncontinue to skill up-even when\nyou\'re offline',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
              child: Text(
                'FIND A COURSE TO DOWNLOAD',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              color: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/list-course', arguments: {
                  'name': 'Recommend',
                  'data': store.getAllCourses(type: 0)
                });
              }),
        ],
      ),
    );
  }
}