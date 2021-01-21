import 'package:advanced_mobile_final_project/model/author_model.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';

import '../app_bar.dart';

class AuthorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    AuthorModel model = ModalRoute.of(context).settings.arguments;
    print(model.name);
    return Scaffold(
      appBar: AppBarCustom(name: S.current.author, avatar: store.avatar),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(model.avatar),
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
                child: Text(S.current.FOLLOW),
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