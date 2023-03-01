//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';

class InterractifPage extends StatefulWidget {

  @override
  /*State<StatefulWidget> createState() {
    return InterractifPageState();
  }*/
  InterractifPageState createState() => InterractifPageState();
}

class InterractifPageState extends State<InterractifPage> {

  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  Color iconColor = Colors.white;
  Color backgroundIconColor = Colors.black;
  bool textButtonPressed = false;
  IconData iconData = Icons.favorite;
  String prenom = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ce que l'on va faire pendant l'initialisation du widget
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //tout ce que l'on va faire quand le widget sera dispose (quand le widget sera supprimé)
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text(updateAppBarText()),),
      body: Center(child: Column(
        children: [
          TextButton(onPressed: updateAppBar, style: TextButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.red) ,
              child: Row(
                children: [
                  Icon(Icons.add),
                  textButtonText(),
                ],)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 10,
              side: BorderSide(color: Colors.black),),
              onPressed: () {
              print("pressed");
              },
              child: const Text("Elevaated"),
              onLongPress: () {
                print("long");
              },),
          IconButton(
              onPressed: clingIconButton,
              icon: Icon(iconData,),
            color: Colors.pink,
            splashColor: Colors.deepPurpleAccent,
          ),
          TextField(
            obscureText: true, // utile pour les password
            decoration: InputDecoration(
                hintText: "entrez votre mot de passe",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
            keyboardType: TextInputType.phone,
            onChanged: (newString) {
            setState(() {
              prenom = newString;
            });},
          ),
          Text(prenom),
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundIconColor,
        onPressed: updateColors,
        child: Icon(Icons.build, color: iconColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  updateColors() {
    setState(() {
      backgroundColor = (backgroundColor == Colors.white) ? Colors.black: Colors.white;
      backgroundIconColor = (backgroundIconColor == Colors.black) ? Colors.white: Colors.black;
      iconColor = (iconColor == Colors.white) ? Colors.black: Colors.white;
      textColor= (textColor == Colors.black) ? Colors.white: Colors.black;
    });
  }

  updateAppBar() {
    //setState(() => textButtonPressed = !textButtonPressed);
    setState(() {
      textButtonPressed = (textButtonPressed == false) ? true: false;
    });
  }

 String updateAppBarText() {
    return (textButtonPressed)? "Bouton pressé": "Bouton a l'arret";
  }

  clingIconButton() {
    setState(() {
      iconData = (iconData == Icons.favorite) ? Icons.favorite_border: Icons.favorite;
    });
  }

  Text textButtonText() {
    return const Text("Je suis la",
      style: TextStyle(
          //color: Colors.black,
          //backgroundColor: Colors.grey
      ),
    );
  }

}