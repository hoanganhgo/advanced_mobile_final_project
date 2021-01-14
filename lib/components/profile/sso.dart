import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SSO extends StatelessWidget {
  double WIDTH = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {

            }),
        title: Text('Single Sign On (SSO)'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Enter your company URL below to sign in'),
            Container(
              width: this.WIDTH,
              child: Column(
                children: [
                  Text(
                      'Company URL',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  TextField(
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: this.WIDTH,
              child: RaisedButton(
                onPressed: () {

                },
                child: Text('CONTINUE'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
            InkWell(
              child: Text(
                  'AUTHORIZE YOUR DEVICE WITH A CODE',
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
              onTap: () {

              },
            )
          ],
        ),
      )
    );
  }

}