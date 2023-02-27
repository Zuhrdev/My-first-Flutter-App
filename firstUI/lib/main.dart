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
                      margin: EdgeInsets.only(left: 10),
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(160)),
                      child: Container(
                        height: 50,
                        width: size.width-100,
                        color: Colors.blue,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 25),
                      child: Text(
                        "Modifier le profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 14, left: 160),
                      child: Icon(
                        Icons.account_box,
                        color: Colors.white,
                      ),
                    ),
                   // SizedBox(height: 50,),
                    ],
                )),
                //Expanded(child: SizedBox(height: 5, width: 50,)),
                Expanded(child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Card(
                      child: Container(height: 50, width: 60, color: Colors.blue,
                        child: Padding(padding: EdgeInsets.only(top: 0 ),child: Icon(Icons.add_circle, size: 35,color: Colors.white,),),
                    ),elevation: 10,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),),
                  ],
                )),
                //Expanded(child:Card(child: Container(height: 50,width: 10,color: Colors.blue, margin: EdgeInsets.only(right: 5),),))
                ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              alignment: Alignment.topLeft,
              child: Text("A propos de moi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Divider(),
            aboutMe(name: "Coordonnées", icon: Icons.add_call),
            aboutMe(name: "Lieu d'étude", icon: Icons.account_balance_rounded),
            aboutMe(name: "Langues maîtrisées", icon:Icons.abc),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              child: Text("Amis", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 25),
                  child:                 friendsList("Forest", "images/warrior.jpg", size.width/4),),
                Padding(padding: EdgeInsets.only(left: 25),
                  child: friendsList("Gerard", "images/wolf.jpg", size.width/4),),
                Padding(padding: EdgeInsets.only(left: 25),
                  child: friendsList("Gerard", "images/wolf.jpg", size.width/4),)
            ]),
            postUser(width: size.width, username: "username"),
            postUser(width: size.width, username: "username"),


          ],
    ),
      ),
      //),
    );
    }
}

Container postUser({required width, required String username, }) {
return Container(
          margin: EdgeInsets.all(5),
          alignment: Alignment.topLeft,
          height: 200,
          width: width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: Colors.white,border: Border.all(color: Colors.black)),
          child: Column( children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black),),
                      height: 50,
                      width: 200,
                    ),
                    Padding(padding: EdgeInsets.only(top: 27, left: 30),
                      child: Text(username, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
                    Padding(padding: EdgeInsets.only(top: 10, left: 290),
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),),
                        child: Padding(padding: EdgeInsets.only(top: 15, left: 20),
                          child: Text("Days ago" ,style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                )


              ],
            ),
            imagePost("images/cover.jpg", 380, 118),
            //buttonContainer(text: "je suis la"),
          ],)

,


      );
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

Row aboutMe({required String name, required IconData icon}) {
  return Row(
    children: [
      Icon(icon),
      Padding(padding: EdgeInsets.only(left: 10), child: Text(name, style: TextStyle(fontSize: 18),),),
    ],
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

Container buttonContainer({IconData? icon, String? text }) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue
    ),
    child: (icon == null)
    ? Text(text ?? "", style: TextStyle(color: Colors.white),)
    : Icon(icon, color: Colors.white,),
  );
}

Column friendsList(String name, String path, double width) {
  return Column(
    children: [
      Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          image : DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      Text(name),
    ],
  );
}

Container imagePost(String path, double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20)
    ),

  );
}

Image fromNetwork() {
  return Image.network(
    ""
    "https://images.pexels.com/photos/11280353/pexels-photo-11280353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    height: 200,
  );
}
