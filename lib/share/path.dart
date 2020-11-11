import 'package:flutter/cupertino.dart';

class Path extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        children: [
          Image.asset('assets/images/java.jpg',
            height: 100,
            width: 200,
          ),
          Text('Learning Java 8 Free',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),),
          Text('3 courses',
          style: TextStyle(
            fontSize: 12
          ),)
        ],
      ),
    );
  }

}