import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Person {
  final String photo;

  final String firstName;
  final String lastName;
  final List<String> address;
  final DateTime birthdate;
  final String nationality;
  final String phoneNumber;
  final String mailAdress;

  Person(this.photo, this.firstName, this.lastName, this.address,
      this.birthdate, this.nationality, this.phoneNumber, this.mailAdress);

  String get fullName {
    return '${this.firstName} ${this.lastName}';
  }

  static fromJson(json) {
    return Person(
        json["photo"],
        json["firstName"],
        json["lastName"],
        List<String>.from(json["address"]),
        DateTime.parse(json["birthdate"]),
        json["nationality"],
        json["phoneNumber"],
        json["mailAdress"]);
  }

  toString() {
    return "name: " + this.fullName + ", address: " + address.join(',');
  }
}

class CV {
  final Person person;
  final List<dynamic> workExperience;
  final List<dynamic> education;
  final List<dynamic> skills;
  final List<dynamic> languages;
  final List<dynamic> hobbies;

  CV(this.person, this.workExperience, this.education, this.skills,
      this.languages, this.hobbies);

  static fromJson(json) {
    final person = Person.fromJson(json['person']);
    final workExperience = json['workExperience'];
    final education = json['education'];
    final skills = json['skills'];
    final languages = json['languages'];
    final hobbies = json['hobbies'];
    // List<Map<String, String>>.from(json['workExperience']);

    return CV(person, workExperience, education, skills, languages, hobbies);
  }

  toString() {
    return "person: " + this.person.toString();
  }
}

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
      ),
      body: FutureBuilder(
        future: fetch("assets/cv-data.json"),
        builder: (BuildContext context, AsyncSnapshot<CV> snapshot) {
          if (snapshot.hasData) {
            return CVWidget(snapshot.data!);
          } else if (snapshot.hasError)
            throw snapshot.error!;
          else
            return CircularProgressIndicator();
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
