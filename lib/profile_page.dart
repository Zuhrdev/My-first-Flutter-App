import 'package:correction_widgets_interractifs/profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  Profile myProfile = Profile(surname: "Mathieu", name: "Codabee");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mon profil"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              color: Colors.deepPurpleAccent.shade100,
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(myProfile.setName()),
                    Text("Age : ${myProfile.setAge()}"),
                    Text("Taille : ${myProfile.setHeight()}"),
                    Text("Genre : ${myProfile.genderString()}"),
                    Text("Hobbies : ${myProfile.setHobbies()}"),
                    Text("Language de programmation favori : ${myProfile.favoriteLang}"),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.deepPurpleAccent, thickness: 2,),

          ],
        ),
      ),
    );
  }



}