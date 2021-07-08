import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            decoration: BoxDecoration(
              color: Color(0xFFF4F3F1),
            ),
            child: Column(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/meme/web.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Button(
                        () => launch(
                            'https://github.com/valentinschabschneider/deckweiss-application/'),
                        Color(0xFF1d1d1d),
                        Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                          size: 40,
                        ),
                        'Code auf GitHub',
                      ),
                      Button(
                        () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CVScreenWidget(),
                            ),
                          )
                        },
                        Color(0xFF8888FF),
                        Icon(
                          FontAwesomeIcons.graduationCap,
                          color: Colors.white,
                          size: 40,
                        ),
                        'Lebenslauf',
                      ),
                      Button(
                        () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MotivationLetterScreen()),
                          )
                        },
                        Color(0xFF8888FF),
                        Icon(
                          FontAwesomeIcons.fileAlt,
                          color: Colors.white,
                          size: 40,
                        ),
                        'Motivationsschreiben',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Alert();
      },
    );
  }
}

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            constraints: BoxConstraints(maxWidth: 550),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFF4F3F1),
            ),
            padding: EdgeInsets.fromLTRB(20, 120, 20, 20),
            child: Text(
                "Ich arbeite laufend daran Funktionen hinzuzufügen, nach denen keiner gefragt hat. Danke für dein Verständnis!",
                style: TextStyle(fontSize: 24, color: Colors.black),
                textAlign: TextAlign.center),
          ),
          Positioned(
            top: -100,
            child: Image.asset("assets/images/under-construction.png",
                width: 200, height: 200),
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Function() onTap;
  final Color backgroundColor;
  final Icon icon;
  final String text;

  Button(this.onTap, this.backgroundColor, this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 2.0),
              blurRadius: 8.0,
              spreadRadius: 2.0)
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: this.onTap,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    width: 70,
                    padding: EdgeInsets.only(left: 10),
                    child: this.icon),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    this.text,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
