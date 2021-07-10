import 'package:flutter/material.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 70,
                  padding: EdgeInsets.only(left: 20),
                  child: this.icon,
                ),
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
