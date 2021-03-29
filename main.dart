import 'package:flutter/material.dart';
import 'package:notify/model/notice_screen.dart';
import 'package:overlay_support/overlay_support.dart';

import 'model/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Notifiche',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
