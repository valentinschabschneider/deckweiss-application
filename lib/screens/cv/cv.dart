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
    bool isScreenWide = MediaQuery.of(context).size.width >= 1500;

    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints viewportConstraints,
      ) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
              minWidth: viewportConstraints.maxWidth,
            ),
            child: Flex(
              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: isScreenWide
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 600),
                      child: Image.asset(
                        this.cv.person.photo,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Column(
                      children: [
                        Text(this.cv.person.fullName),
                        Text(DateFormat('dd. MMMM yyyy')
                            .format(this.cv.person.birthdate)),
                        Text(this.cv.person.nationality),
                        Text(this.cv.person.address.join(', ')),
                        Text(this.cv.person.phoneNumber),
                        InkWell(
                          child: Text(this.cv.person.mailAdress,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue)),
                          onTap: () =>
                              launch('mailto:${this.cv.person.mailAdress}'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Berufserfahrung"),
                        ...this.cv.workExperience.map((e) => Row(children: [
                              Text(e["dateRange"]),
                              Text(e["company"])
                            ]))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ausbildung"),
                        ...this.cv.education.map((e) => Row(children: [
                              Text(e["dateRange"]),
                              Text(e["school"])
                            ]))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kenntnisse"),
                        ...this.cv.skills.map((e) =>
                            Row(children: [Text(e["level"]), Text(e["skill"])]))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sprachen"),
                        ...this.cv.languages.map((e) => Row(
                            children: [Text(e["level"]), Text(e["language"])]))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("hobbies"),
                        ...this.cv.hobbies.map(
                              (e) => Row(
                                children: [
                                  Text(e),
                                ],
                              ),
                            ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
