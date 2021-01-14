import 'package:advanced_mobile_final_project/business/share/other/app_bar.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:advanced_mobile_final_project/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);
    UserModel model = store.user;

    return Scaffold(
      appBar: AppBarCustom(name:'Profile', avatar: store.avatar),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(model.avatar)
            ),
            SizedBox(height: 5),
            Text(model.name == null ? 'Unknown' : model.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 10),
            Divider(height: 5),
            Container(
              margin: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text('Email: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  ),
                  Text(model.email,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18
                    ),
                  ),
                ],
              )
            ),
            Container(
                margin: EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text('Phone: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                    ),
                    Text(model.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
