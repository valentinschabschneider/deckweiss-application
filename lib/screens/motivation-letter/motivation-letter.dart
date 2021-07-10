import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MotivationLetterScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Motivationsschreiben',
        ),
        backgroundColor: Color(0xFF1d1d1d),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 800),
          child: FutureBuilder(
            future: rootBundle.loadString("assets/motivation-letter.md"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return snapshot.hasData
                  ? Markdown(
                      data: snapshot.data!,
                      styleSheet: MarkdownStyleSheet(
                        textAlign: WrapAlignment.spaceEvenly,
                        p: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onTapLink: (text, url, title) {
                        launch(url!);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
