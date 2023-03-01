import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class MainTitleText extends Text {
  final String data;

  MainTitleText({super.key, required this.data}): super(
    data,
    style: TextStyle(
      fontSize: 25,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold
    )
  );
}

//Text("Pessi 5169", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500)),