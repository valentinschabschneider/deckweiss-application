import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final double maxWidth;

  Header(this.maxWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 600,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF1d1d1d),
      ),
      width: double.infinity,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: Image.asset(
          'assets/images/meme/web.png',
        ),
      ),
    );
  }
}
