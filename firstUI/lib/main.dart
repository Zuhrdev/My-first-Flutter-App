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
          alignment: Alignment.topLeft,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: size.height/4,
                width: size.width,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/cover.jpg"),),
              ),),
              Padding(padding: EdgeInsets.only(top: 150), child: UnderAvatar(radius: 50),),
              Padding(padding: EdgeInsets.only(top: 155), child: ProfileAvtar(radius: 45),),
              Container(
                height: size.height,
              )
            ],
          //Container(
           // height: size.height/4,
            //width: size.width,
            //decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/cover.jpg"),fit: BoxFit.cover)),
            //child: ProfileAvtar(radius: 40),
          ),

          //Image.asset("images/cover.jpg", height: 200, width: size.width, fit: BoxFit.cover),
      ),

      //child: fromAsset(height: 200, width: size.width, path: "images/cover.jpg"),
      //),
    );
  }
}

CircleAvatar ProfileAvtar({required double radius}) {
  return CircleAvatar(
    radius: radius,
    foregroundImage: AssetImage("images/profilepicture.jpg"),
  );
}

CircleAvatar UnderAvatar({required double radius}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: Colors.white,
  );
}

Image fromAsset(
    {required double height, required double width, required String path}) {
  return Image.asset(
    path,
    height: height,
    width: width,
  );
}

Image fromNetwork() {
  return Image.network(
    ""
    "https://images.pexels.com/photos/11280353/pexels-photo-11280353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    height: 200,
  );
}
