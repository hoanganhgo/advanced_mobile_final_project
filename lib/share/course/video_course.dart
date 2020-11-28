import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Image.asset('assets/images/java.jpg',
              height: 150,
              width: 200,
            ),
            Text('Java Programming',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Level',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
                Icon(Icons.control_point_sharp),
                Text('Date',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
                Icon(Icons.control_point_sharp),
                Text('Time',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text('(100)',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(Icons.bookmark_border_rounded, size: 40),
                    onPressed: null),
                IconButton(
                    icon: Icon(Icons.network_wifi, size: 40),
                    onPressed: null),
                IconButton(
                    icon: Icon(Icons.download_rounded, size: 40),
                    onPressed: null),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}