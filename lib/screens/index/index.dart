import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:deckweiss_application/screens/cv/cv.dart';
import 'package:deckweiss_application/screens/motivation-letter/motivation-letter.dart';

import 'constants.dart';
import 'widgets/alert.dart';
import 'widgets/button.dart';
import 'widgets/header.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () => showAlert(context));
  }

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= BUTTON_BREAK_WIDTH;

    return MaterialApp(
      title: "Deckweiss Bewerbung",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Header(MAX_WIDTH),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: MAX_WIDTH),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Flex(
                          direction:
                              isScreenWide ? Axis.horizontal : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                      builder: (context) =>
                                          MotivationLetterScreen()),
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
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Button(
                              () => launch(GITHUB_URL),
                              Color(0xFF1d1d1d),
                              Icon(
                                FontAwesomeIcons.github,
                                color: Colors.white,
                                size: 40,
                              ),
                              'Code auf GitHub',
                            ),
                          ],
                        ),
                      ),
                    ],
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
