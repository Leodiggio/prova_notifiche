
import 'package:flutter/material.dart';

import 'createScreenNotice.dart';

class NoticeScreen extends StatefulWidget {
  @override
  NoticeScreenState createState() => NoticeScreenState();
}

class NoticeScreenState extends State<NoticeScreen> {

  @override
  Widget set_notice_screen (BuildContext context) {
    return ListView(
      children: [
         
          createScreenNotice(color: Color.fromARGB(255, 160, 25, 29), navigate: null, imageURL: null, title: Text("Il serbatoio sta per esplodere"), subtitle: Text("allah akbar")).screenOne(context),

          Container(
            height: 2,
            color: Color.fromARGB(255, 160, 25, 29),
          ),

          createScreenNotice(color: Color.fromARGB(255, 160, 25, 29), navigate: null, imageURL: null, title: Text("Il serbatoio sta per sboccare"), subtitle: Text("ROSSELLA")).screenOne(context),

        Container(
            height: 2,
            color: Color.fromARGB(255, 160, 25, 29),
          ),

        createScreenNotice(color: Color.fromARGB(255, 160, 25, 29), navigate: null, imageURL: null, title: Text("Il serbatoio sta per sboccare"), subtitle: Text("ROSSELLA")).screenOne(context),

        Container(
          height: 2,
          color: Color.fromARGB(255, 160, 25, 29),
        ),

        createScreenNotice(color: Color.fromARGB(255, 160, 25, 29), navigate: null, imageURL: null, title: Text("Il serbatoio sta per sboccare"), subtitle: Text("ROSSELLA")).screenOne(context),

        Container(
          height: 2,
          color: Color.fromARGB(255, 160, 25, 29),
        ),
        
          ],
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
class MyPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notifiche"),
        backgroundColor: Color.fromARGB(255, 160, 25, 29),
      ),

      body: NoticeScreenState().set_notice_screen(context),
    );
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'assets',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: MyPage(),
    );
  }
}