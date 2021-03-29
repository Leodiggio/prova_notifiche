import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/model/push_notification.dart';
import 'package:overlay_support/overlay_support.dart';

import 'NotificationBadge.dart';
import 'notice_screen.dart';

Future<dynamic> _firebaseMessagingBackgroundHandler(
    Map<String, dynamic> message,
    ) async {
  // Initialize the Firebase app
  await Firebase.initializeApp();
  print('onBackgroundMessage received: $message');
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PushNotification _notificationInfo;
  int _totalNotifications;
  FirebaseMessaging _messaging = FirebaseMessaging();

  void registerNotification() async {
    // Initialize the Firebase app
    await Firebase.initializeApp();

    // For handling the received notifications
    _messaging.configure(
      onMessage: (message) async {
        print('onMessage received: $message');

        PushNotification notification = PushNotification.fromJson(message);

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });

        // For displaying the notification as an overlay
        showSimpleNotification(
          Text(_notificationInfo.title),
          leading: NotificationBadge(totalNotifications: _totalNotifications),
          subtitle: Text(_notificationInfo.body),
          background: Colors.cyan[700],
          duration: Duration(seconds: 4),
        );
      },
      onBackgroundMessage: _firebaseMessagingBackgroundHandler,
      onLaunch: (message) async {
        print('onLaunch: $message');

        PushNotification notification = PushNotification.fromJson(message);

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });
      },
      onResume: (message) async {
        print('onResume: $message');

        PushNotification notification = PushNotification.fromJson(message);

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });
      },
    );

    // Used to get the current FCM token
    _messaging.getToken().then((token) {
      print('Token: $token');
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    _totalNotifications = 0;
    registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifiche'),
        brightness: Brightness.dark,
      ),
      body: NoticeScreenState().set_notice_screen(context),
    );
  }
}