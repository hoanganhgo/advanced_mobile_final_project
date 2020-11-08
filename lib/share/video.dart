import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      height: 300,
      child: Column(
        children: [
          Image.asset('assets/images/java.jpg',
            height: 150,
            width: 200,
          ),
          Text('Java 8',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.black
            ),
          ),
          Text('John son',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
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
            ],
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
    );
  }

}