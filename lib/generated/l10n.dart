// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Browser`
  String get browser {
    return Intl.message(
      'Browser',
      name: 'browser',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Re-Password`
  String get re_password {
    return Intl.message(
      'Re-Password',
      name: 're_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get btn_ok {
    return Intl.message(
      'OK',
      name: 'btn_ok',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get SIGN_IN {
    return Intl.message(
      'SIGN IN',
      name: 'SIGN_IN',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get SIGN_UP {
    return Intl.message(
      'SIGN UP',
      name: 'SIGN_UP',
      desc: '',
      args: [],
    );
  }

  /// `Email is empty`
  String get message_email_empty {
    return Intl.message(
      'Email is empty',
      name: 'message_email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get message_email_invalid {
    return Intl.message(
      'Email is not valid',
      name: 'message_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must have 10 number`
  String get message_phone_invalid {
    return Intl.message(
      'Phone number must have 10 number',
      name: 'message_phone_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password is not match`
  String get message_password_not_match {
    return Intl.message(
      'Password is not match',
      name: 'message_password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Username or Password is incorrect`
  String get message_sign_in_fail {
    return Intl.message(
      'Username or Password is incorrect',
      name: 'message_sign_in_fail',
      desc: '',
      args: [],
    );
  }

  /// `Username is empty`
  String get message_username_empty {
    return Intl.message(
      'Username is empty',
      name: 'message_username_empty',
      desc: '',
      args: [],
    );
  }

  /// `Username must not contain space character`
  String get message_username_space {
    return Intl.message(
      'Username must not contain space character',
      name: 'message_username_space',
      desc: '',
      args: [],
    );
  }

  /// `Password must have greater than 6 character`
  String get message_password_short {
    return Intl.message(
      'Password must have greater than 6 character',
      name: 'message_password_short',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}