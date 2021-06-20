import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Deckweiss Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
              child: Column(
            children: <Widget>[
              Image.asset(
                'assets/meme/web.png',
                fit: BoxFit.cover,
              ),
              Text('Site under construction!', style: TextStyle(
              color: Colors.red,
              fontSize: 25.0,
            ),),
              new InkWell(
              child: new Text('Git Repo', style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
              onTap: () => launch('https://github.com/valentinschabschneider/deckweiss-application/')
          ),
            ],
          )),
        ));
  }
}
