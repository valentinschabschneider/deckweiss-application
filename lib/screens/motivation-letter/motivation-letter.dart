import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MotivationLetterScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Motivationsschreiben',
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("motivation-letter.txt"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!);
          } else if (snapshot.hasError)
            throw snapshot.error!;
          else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
