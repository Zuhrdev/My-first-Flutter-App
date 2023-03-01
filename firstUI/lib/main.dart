import 'package:first_ui/main_title_text.dart';
import 'package:flutter/material.dart';
import 'post.dart';
import 'section_name.dart';

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

  List<Post> posts = [
    Post(name: "Donald Trump", time: "3 jours", desc: "BLM", path: "images/blm.jpeg"),
    Post(name: "Donald Trump", time: "5 jours", desc: "BLddddM", path: "images/blm.jpeg")
  ];

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
            MainTitleText(data: "Pessi 5169"),
            //text pessi !!!!!!!!!!!!!!!!!!
            Text("Un Goat n'a pas besoin de bio, mais j'aime donner\n                        de la lecture aux abrutis", style: TextStyle(color: Colors.grey, fontSize: 15),),
            Divider(),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "modifier le profil"),),
                buttonContainer(icon: Icons.account_box),
                ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: SectionName("A propos de moi"),
            ),
            const Divider(thickness: 2,),
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
            //posts(time: "3 days", image: "images/cover.jpg", desc: "this sound to be a fucking forest"),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              child: SectionName("Mes Posts"),
            ),
            post(post: posts[0]),
            post(post: posts[1]),

          ],
    ),
      ),
      //),
    );
    }
}

Container post({required Post post}) {
  return Container(
    margin: EdgeInsets.only(top: 8, left: 3, right: 3),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
    child: Column(
      children: [
        Row(
          children: [
            ProfileAvtar(radius: 20),
            Padding(padding: EdgeInsets.only(left: 8)),
            Text("Pessi 6951"),
            Spacer(),
            postDaysAgo(post.time)
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Image.asset(post.path, fit: BoxFit.cover),),
        Text(post.desc, style: TextStyle(color: Colors.blueAccent),textAlign: TextAlign.center,),
        Divider(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.favorite),
            Text(post.setLikes()),
            Icon(Icons.message),
            Text(post.setComments()),
          ],
        )
      ],
    ),
  );
}

Text postDaysAgo(String time) {
  return Text("Posté il y a $time", style: TextStyle(color: Colors.blue),);
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
    ? Center(child: Text(text ?? "", style: TextStyle(color: Colors.white)),)
    : Icon(icon, color: Colors.white,),
    height: 50,
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
