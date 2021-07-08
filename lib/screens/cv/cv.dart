import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:deckweiss_application/models/cv.dart';

class CVScreenWidget extends StatelessWidget {
  Future<CV> fetch(String dataFile) async {
    String data = await rootBundle.loadString(dataFile);
    final jsonResult = json.decode(data);

    return CV.fromJson(jsonResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lebenslauf',
        ),
        backgroundColor: Color(0xFF1d1d1d),
      ),
      body: FutureBuilder(
        future: fetch("assets/cv-data.json"),
        builder: (BuildContext context, AsyncSnapshot<CV> snapshot) {
          return snapshot.hasData
              ? CVWidget(snapshot.data!)
              : CircularProgressIndicator();
        },
      ),
    );
  }
}

class CVWidget extends StatelessWidget {
  final CV cv;

  CVWidget(this.cv);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
                constraints: BoxConstraints(maxHeight: 720),
                child: Image.asset(
                  this.cv.person.photo,
                  fit: BoxFit.fitHeight,
                )),
            Text(this.cv.person.fullName),
            Text(DateFormat('dd. MMMM yyyy').format(this.cv.person.birthdate)),
            Text(this.cv.person.nationality),
            Text(this.cv.person.address.join(', ')),
            Text(this.cv.person.phoneNumber),
            InkWell(
              child: Text(this.cv.person.mailAdress,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue)),
              onTap: () => launch('mailto:${this.cv.person.mailAdress}'),
            ),
          ],
        ),
        Column(
          children: [
            Text("Berufserfahrung"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: this.cv.workExperience.length,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Text(this.cv.workExperience[index]["dateRange"]),
                  Text(this.cv.workExperience[index]["company"]),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Ausbildung"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: this.cv.education.length,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Text(this.cv.education[index]["dateRange"]),
                  Text(this.cv.education[index]["school"]),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Kenntnisse"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: this.cv.skills.length,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Text(this.cv.skills[index]["level"]),
                  Text(this.cv.skills[index]["skill"]),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Sprachen"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: this.cv.languages.length,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Text(this.cv.languages[index]["level"]),
                  Text(this.cv.languages[index]["language"]),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("Interessen"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: this.cv.hobbies.length,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Text(this.cv.hobbies[index]),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
