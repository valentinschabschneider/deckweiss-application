import 'package:flutter/material.dart';

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

void showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Alert();
    },
  );
}
