import 'package:correction_widgets_interractifs/profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  Profile myProfile = Profile(surname: "Mathieu", name: "Codabee");
  late TextEditingController surname;
  late TextEditingController name;
  late TextEditingController secret;
  bool showSecret = false;
  Map<String, bool> hobbies = {
    "Petanque": false,
    "Football": false,
    "Rugby": false,
    "code": false,
    "Manga": false,
    "foooooood": false,
  };


  @override
  void initState() {
    // TODO: implement initState
    surname = TextEditingController();
    name = TextEditingController();
    secret = TextEditingController();
    surname.text = myProfile.surname;
    name.text = myProfile.name;
    secret.text = myProfile.secret;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    surname.dispose();
    name.dispose();
    secret.dispose();
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
                    ElevatedButton(
                        onPressed: (() {
                          updateSecret();
                        }),
                        child: Text((showSecret)? "cacher secret" : "Montrer secret"),
                    ),
                    (showSecret)? Text(myProfile.secret) : Container(height: 0,width: 0,),

                  ],
                ),
              ),
            ),
            Divider(color: Colors.deepPurpleAccent, thickness: 2,), 
          myTitle("Modifier les infos"),
            myTextField(controller: surname, hint: "Entrez votre prénom"),
            myTextField(controller: name, hint: "Entrez votre nom"),
            myTextField(controller: secret, hint: "Entrez votre secret", isSecret : true),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text("Genre : ${myProfile.genderString()}"),
                Switch(value: myProfile.gender, onChanged: ((newBool) {
                  setState(() {
                    myProfile.gender = newBool;
                  });
                }))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taille : ${myProfile.setHeight()}"),
                Slider(
                    value: myProfile.height,
                    min: 0,
                    max: 210,
                    onChanged: ((newHeight) {
                  setState(() {
                    myProfile.height = newHeight;
                  });
                }))
              ],
            ),
            Divider(color: Colors.deepPurple,thickness: 2,),
            myHobbies(),
            Divider(color: Colors.deepPurple, thickness: 2,),
            myRadios(),
          ],
        ),
      ),
    );
  }

  TextField myTextField({required TextEditingController controller, required String hint, bool isSecret = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      obscureText: isSecret,
      onSubmitted: ((newValue) {
        updateUser();
      }),
    );
  }

  updateUser() {
    setState(() {
      myProfile = Profile(
        surname: (surname.text != myProfile.surname) ? surname.text : myProfile.surname,
        name : (name.text != myProfile.name) ? name.text : myProfile.name,
        secret : secret.text,
        favoriteLang: myProfile.favoriteLang,
        hobbies: myProfile.hobbies,
        height: myProfile.height,
        age: myProfile.age,
        gender:myProfile.gender,
      );
    });
  }

  updateSecret() {
    setState(() {
      showSecret = !showSecret;
    });
  }

  Column myHobbies() {
    List<Widget> widgets = [myTitle("Mes Hobbies")];
    hobbies.forEach((hobby, like) {
      Row r = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(hobby),
          Checkbox(value: like, onChanged: (newBool) {
            setState(() {
              hobbies[hobby] = newBool ?? false;
              List<String> str = [];
              hobbies.forEach((key, value) {
                if(value == true) {
                  str.add(key);
                }
              });
              myProfile.hobbies = str;
            });
          })
        ],
      );
      widgets.add(r);
    });
    return Column(children: widgets);
  }

  Column myRadios() {
    List<Widget> widgets = [myTitle("Mon language préféré")];
    List<String> langs = ["Dart", "Swift", "Kotlin", "Java", "Python"];
    int index = langs.indexWhere((lang) => lang.startsWith(myProfile.favoriteLang));
    for (var x = 0; x < langs.length; x++) {
      Row r = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(langs[x]),
          Radio(value: x, groupValue: index, onChanged: (newValue) {
            setState(() {
              myProfile.favoriteLang = langs[newValue as int];
            });
          })
        ],

      );
      widgets.add(r);
    }
    return Column(
      children: widgets,);
  }
  
  Text myTitle(String text) {
    return Text(
      text, 
      style: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),);
  }



}