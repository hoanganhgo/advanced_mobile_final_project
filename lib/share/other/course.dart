import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset('assets/images/java.jpg',
            height: 70,
            width: 100,
          ),
          Column(
            children: [
              Text('All hand on teach',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              Text('e-learning',
                style: TextStyle(
                  fontSize: 13,
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Beginer - ',
                    style: TextStyle(
                      fontSize: 13,
                    ),),
                  Text('Nov 2020 - ',
                    style: TextStyle(
                      fontSize: 13,
                    ),),
                  Text('19m',
                    style: TextStyle(
                      fontSize: 13,
                    ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}