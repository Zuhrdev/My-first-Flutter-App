import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
  final String text;
  SectionName(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, ),
        ),
    );
  }
}