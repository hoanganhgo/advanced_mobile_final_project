import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:advanced_mobile_final_project/model/store_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends PreferredSize {
  final String name;
  final double height;
  final ImageProvider avatar;

  AppBarCustom({this.height = kToolbarHeight, this.name, this.avatar});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreModel>(context);

    return AppBar(
      title: Text(this.name),
      backgroundColor: store.primaryColor,
      actions: [
        FlatButton(
            child: CircleAvatar(
              backgroundImage: this.avatar,
            ),
            onPressed: () {
              if (this.name != 'Sign In' && this.name != 'Profile') {
                if (store.user == null) {
                  Navigator.pushNamed(context, '/login');
                } else{
                  Navigator.pushNamed(context, '/profile');
                }
              }
            },
        ),
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              if (this.name != "Setting" && this.name != S.current.sign_in) {
                Navigator.pushNamed(context, '/setting');
              }
            })
      ],
    );
  }
}
