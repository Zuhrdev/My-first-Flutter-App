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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/cover.jpg",  height: 200, width: size.width, fit: BoxFit.cover,),
                Padding(padding: EdgeInsets.only(top: 140), child: UnderAvatar(radius: 50),),
                Padding(padding: EdgeInsets.only(top: 145), child: ProfileAvtar(radius: 45),)
              ],
            ),
            Text("Pessi 5169", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500)),
            Text("Un Goat n'a pas besoin de bio, mais j'aime donner\n                        de la lecture aux abrutis", style: TextStyle(color: Colors.grey, fontSize: 15),),
            Divider(),
            Row(
              children: [
                Expanded(
                    child : Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Card(
                      margin: EdgeInsets.only(left: 20),
                      elevation: 10,
                      child: Container(
                        height: 50,
                        width: 275,
                        color: Colors.blue,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 25),
                      child: Text(
                        "modifier le profil",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 17, left: 145),
                      child: Icon(
                        Icons.account_box,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
                Expanded(child: Card(child: Container(height: 50,width: size.width/5,color: Colors.black,),))
              ],
            ),
          ],
        ),
      ),
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
