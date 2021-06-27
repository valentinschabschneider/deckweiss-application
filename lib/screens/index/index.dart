import 'package:deckweiss_application/screens/cv/cv.dart';
import 'package:deckweiss_application/screens/motivation-letter/motivation-letter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Index extends StatelessWidget {
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
                'images/meme/web.png',
                fit: BoxFit.cover,
              ),
              Text(
                'Site under construction!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                ),
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
}
