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
