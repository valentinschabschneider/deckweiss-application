import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:deckweiss_application/screens/cv/cv.dart';
import 'package:deckweiss_application/screens/motivation-letter/motivation-letter.dart';

class Index extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
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
                'assets/images/meme/web.png',
                fit: BoxFit.cover,
              ),
              InkWell(
                  child: Text('Git Repo',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue)),
                  onTap: () => launch(
                      'https://github.com/valentinschabschneider/deckweiss-application/')),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CVScreenWidget()),
                  );
                },
                child: Text('Lebenslauf'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MotivationLetterScreen()),
                  );
                },
                child: Text('Motivationsschreiben'),
              ),
            ],
          )),
        ));
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Stack(
            //overflow: Overflow.visible,
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 600),
                //height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFF4F3F1)),
                padding: EdgeInsets.fromLTRB(20, 120, 20, 20),
                child: Text(
                    "We (I) are hard at work to implement features nobody asked for. Thank you for your understanding!",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    textAlign: TextAlign.center),
              ),
              Positioned(
                  top: -100,
                  child: Image.asset("assets/images/under-construction.png",
                      width: 200, height: 200))
            ],
          ),
        );
      },
    );
  }
}
