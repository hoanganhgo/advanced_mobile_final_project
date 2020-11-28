import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyDownload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmptyDownloadState();
  }
}

class _EmptyDownloadState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
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
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              onPressed: () {

              }),
        ],
      ),
    );
  }
}