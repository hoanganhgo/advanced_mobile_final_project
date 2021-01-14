import 'package:advanced_mobile_final_project/business/share/other/app_bar.dart';
import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    AuthorModel model = ModalRoute.of(context).settings.arguments;
    print(model.name);
    return Scaffold(
      appBar: AppBarCustom(name: 'Author', avatar: store.avatar),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(model.imageLink),
            ),
            SizedBox(height: 5),
            Text(model.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            Container(
              width: 300,
              child: RaisedButton(
                onPressed: () {

                },
                color: Colors.blue,
                child: Text('FOLLOW'),
              ),
            ),
            Text('Miko Jeson is my idol',
              style: TextStyle(
                fontSize: 14,
              ),),
            Row(
              children: [
                IconButton(icon: Icon(Icons.wifi), onPressed: null),
                IconButton(icon: Icon(Icons.swipe), onPressed: null),
              ],
            )
          ],
        ),
      )
    );
  }

}