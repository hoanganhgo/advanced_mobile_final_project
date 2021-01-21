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

  /// `English`
  String get my_language {
    return Intl.message(
      'English',
      name: 'my_language',
      desc: '',
      args: [],
    );
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

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `SEND EMAIL`
  String get send_email {
    return Intl.message(
      'SEND EMAIL',
      name: 'send_email',
      desc: '',
      args: [],
    );
  }

  /// `Recommend for you`
  String get recommend {
    return Intl.message(
      'Recommend for you',
      name: 'recommend',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Course`
  String get favorite {
    return Intl.message(
      'Favorite Course',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Top Authors`
  String get top_authors {
    return Intl.message(
      'Top Authors',
      name: 'top_authors',
      desc: '',
      args: [],
    );
  }

  /// `My Courses`
  String get my_courses {
    return Intl.message(
      'My Courses',
      name: 'my_courses',
      desc: '',
      args: [],
    );
  }

  /// `Top New Courses`
  String get top_new_courses {
    return Intl.message(
      'Top New Courses',
      name: 'top_new_courses',
      desc: '',
      args: [],
    );
  }

  /// `Top Sell Courses`
  String get top_sell_courses {
    return Intl.message(
      'Top Sell Courses',
      name: 'top_sell_courses',
      desc: '',
      args: [],
    );
  }

  /// `Top Rate Courses`
  String get top_rate_courses {
    return Intl.message(
      'Top Rate Courses',
      name: 'top_rate_courses',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Anonymous`
  String get anonymous {
    return Intl.message(
      'Anonymous',
      name: 'anonymous',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE PROFILE`
  String get UPDATE_PROFILE {
    return Intl.message(
      'UPDATE PROFILE',
      name: 'UPDATE_PROFILE',
      desc: '',
      args: [],
    );
  }

  /// `SIGN OUT`
  String get SIGN_OUT {
    return Intl.message(
      'SIGN OUT',
      name: 'SIGN_OUT',
      desc: '',
      args: [],
    );
  }

  /// `FORGET PASSWORD`
  String get FORGET_PASSWORD {
    return Intl.message(
      'FORGET PASSWORD',
      name: 'FORGET_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `Nick name is empty`
  String get name_empty {
    return Intl.message(
      'Nick name is empty',
      name: 'name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Choose avatar`
  String get choose_avatar {
    return Intl.message(
      'Choose avatar',
      name: 'choose_avatar',
      desc: '',
      args: [],
    );
  }

  /// `NickName`
  String get nick_name {
    return Intl.message(
      'NickName',
      name: 'nick_name',
      desc: '',
      args: [],
    );
  }

  /// `Notify`
  String get notify {
    return Intl.message(
      'Notify',
      name: 'notify',
      desc: '',
      args: [],
    );
  }

  /// `Update profile success`
  String get update_profile_success {
    return Intl.message(
      'Update profile success',
      name: 'update_profile_success',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get not_found {
    return Intl.message(
      'Not Found',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `ALL`
  String get ALL {
    return Intl.message(
      'ALL',
      name: 'ALL',
      desc: '',
      args: [],
    );
  }

  /// `COURSES`
  String get COURSES {
    return Intl.message(
      'COURSES',
      name: 'COURSES',
      desc: '',
      args: [],
    );
  }

  /// `AUTHORS`
  String get AUTHORS {
    return Intl.message(
      'AUTHORS',
      name: 'AUTHORS',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your language`
  String get choose_language {
    return Intl.message(
      'Please choose your language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get about_me {
    return Intl.message(
      'About me',
      name: 'about_me',
      desc: '',
      args: [],
    );
  }

  /// `Full name: Luong Hoang Anh\nCode: 1712276\nUniversity: HCMUS\nEmail: anhluong660@gmail.com`
  String get my_info {
    return Intl.message(
      'Full name: Luong Hoang Anh\nCode: 1712276\nUniversity: HCMUS\nEmail: anhluong660@gmail.com',
      name: 'my_info',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get author {
    return Intl.message(
      'Author',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `FOLLOW`
  String get FOLLOW {
    return Intl.message(
      'FOLLOW',
      name: 'FOLLOW',
      desc: '',
      args: [],
    );
  }

  /// `Hours: `
  String get hours {
    return Intl.message(
      'Hours: ',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `You must login to like this course`
  String get notify_like {
    return Intl.message(
      'You must login to like this course',
      name: 'notify_like',
      desc: '',
      args: [],
    );
  }

  /// `You must login to register this course`
  String get notify_register {
    return Intl.message(
      'You must login to register this course',
      name: 'notify_register',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully registered for the course`
  String get register_success {
    return Intl.message(
      'You have successfully registered for the course',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `You have already subscribe for this course`
  String get already_subscribe {
    return Intl.message(
      'You have already subscribe for this course',
      name: 'already_subscribe',
      desc: '',
      args: [],
    );
  }

  /// `You must sign in to rate this course`
  String get notify_rating {
    return Intl.message(
      'You must sign in to rate this course',
      name: 'notify_rating',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Lesson`
  String get lesson {
    return Intl.message(
      'Lesson',
      name: 'lesson',
      desc: '',
      args: [],
    );
  }

  /// `Exercise`
  String get exercise {
    return Intl.message(
      'Exercise',
      name: 'exercise',
      desc: '',
      args: [],
    );
  }

  /// `Please Sign in to watch this content`
  String get request_sign_in {
    return Intl.message(
      'Please Sign in to watch this content',
      name: 'request_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `You have not chosen any lesson yet`
  String get not_choose_lesson {
    return Intl.message(
      'You have not chosen any lesson yet',
      name: 'not_choose_lesson',
      desc: '',
      args: [],
    );
  }

  /// `courses`
  String get courses {
    return Intl.message(
      'courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Number of question`
  String get number_question {
    return Intl.message(
      'Number of question',
      name: 'number_question',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get see_all {
    return Intl.message(
      'See all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Comment Empty`
  String get comment_empty {
    return Intl.message(
      'Comment Empty',
      name: 'comment_empty',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comment {
    return Intl.message(
      'Comments',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
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