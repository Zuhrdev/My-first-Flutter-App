import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Page"),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Card(

         )
          ),
          //child: fromAsset(height: 200, width: size.width, path: "images/cover.jpg"),
        //),
      );
  }
}

CircleAvatar ProfileAvtar({required double radius}) {
  return CircleAvatar(
    radius: radius,
    foregroundImage: AssetImage("images/profile.jpeg"),
  );
}

Image fromAsset({required double height, required double width, required String path}) {
  return Image.asset(
    path,
    height: height,
    width: width,
  );
}

Image fromNetwork() {
  return Image.network(""
      "https://images.pexels.com/photos/11280353/pexels-photo-11280353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    height: 200,
  );
}


