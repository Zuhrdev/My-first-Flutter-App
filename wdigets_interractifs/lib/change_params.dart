import 'package:flutter/material.dart';
import 'title_text.dart';

class ExerciseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExerciseWidgetState();
  }
}

enum Language {dart, c}
Language? _language = Language.dart;


class ExerciseWidgetState extends State<ExerciseWidget> {

  Color backGroundColor = Colors.white;
  late TextEditingController controllerSurname;
  late TextEditingController controllerName;
  late TextEditingController controllerSecret;
  late TextEditingController controllerTest;
  bool textButtonPressed = false;
  bool switchGenderValue = false;
  String prenom = "";
  String name = "";
  String secret = "";
  String language = "";
  String secretDisplay = "cachée";
  double sliderTailleValue = 120;
  Map<String, bool>hobbies= {
    "MMA": false,
    "Boxe": false,
    "Football": false,
    "Informatique": false
  };
  Map<String, bool>courses = {
    "carottes": false,
    "oignons": false,
    "frommage": true,
  };



  @override
  void initState() {
    controllerSurname = TextEditingController();
    controllerName = TextEditingController();
    controllerSecret = TextEditingController();
    controllerTest = TextEditingController();
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(title: const Text("Mon profil"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 325,
                  width: size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), /*color: Colors.purple[200]*/),
                  child: Card(
                    elevation: 20,
                    color: Colors.purple[100],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                  child:
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("$name $prenom", style: TextStyle(fontSize: 25),),
                    Text("Age :", style: TextStyle(fontSize: 25)),
                    Text("Taille : ${sliderTailleValue.toInt()} cm", style: TextStyle(fontSize: 25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Genre : ", style: TextStyle(fontSize: 25)),
                      Text(updateGender(), style: TextStyle(fontSize: 25),),
                    ],),
                    Text("Hobbies :", style: TextStyle(fontSize: 25)),
                    Row(children: [
                      Text("Hobbies :", style: TextStyle(fontSize: 25),),
                      dispHobbies(),
                    ],mainAxisAlignment: MainAxisAlignment.center,),
                      Row(children: [
                        Text("Language préféré :", style: TextStyle(fontSize: 25),),
                        Text(_language.toString(), style: TextStyle(fontSize: 25),),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,),
                      TextButton(style: TextButton.styleFrom(backgroundColor: Colors.purple[200]), onPressed: () {setState(() => textButtonPressed = !textButtonPressed);},
                      child:
                        Text("Montrer votre phrase secrète", style: TextStyle(fontSize: 18)),
                      ),
                    Text(updateSecretDisplay(), style: TextStyle(fontSize: 25)),
                  ]
//                  Text("name : $name prenom : $prenom\n", style: TextStyle(fontSize: 30),)
                  ,))
              ],
            ),
            Divider(color: Colors.purple, thickness: 2,),
            Container(margin: EdgeInsets.all(5),alignment: Alignment.center,
              child: MainTitleText(data: "Modifier les infos",),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child:                 TextField(
                    controller: controllerName,
                    decoration: InputDecoration(hintText: "Nom", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                    onChanged: (newString) {setState(() {
                      name = newString;
                    });},
                  ),),
                Padding(padding: EdgeInsets.all(10),
                  child:                TextField(
                    controller: controllerSurname,
                    decoration: InputDecoration(hintText: "Prénom", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                    onChanged: (newString) {setState(() {
                      prenom = newString;
                    });},
                  ),),
                Padding(padding: EdgeInsets.all(10),
                child: TextField(
                  controller: controllerSecret,
                  decoration: InputDecoration(hintText: "Entrez votre phrase secrète", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                  ),
                  onChanged: (newString) {
                    setState(() {
                      secret = newString;
                    });
                  },
                  obscureText: true,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Genre féminin"),
                    Switch(value: switchGenderValue, onChanged: ((newValue) { setState(() { switchGenderValue = newValue;});
                    }))
                  ],
                ),
                Row(
                  children: [
                    Text("Taille (en cm)"),
                    Slider(value: sliderTailleValue, min: 50, max: 220, onChanged: ((newValue) {
                      setState(() {
                        sliderTailleValue = newValue;
                      });
                    })),
                    Text("${sliderTailleValue.toInt()} cm")
                  ],
                ),
                Divider(color: Colors.purple,thickness: 2,),
                MainTitleText(data: "Mes Hobbies"),
                checksHobbies(),
                ListTile(
                  title: Text("Dart"),
                  leading: Radio<Language>(
                    value: Language.dart,
                    groupValue: _language,
                    onChanged: (Language? newValue) {
                      setState(() {
                        _language = newValue;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("c"),
                  leading: Radio<Language>(
                    value: Language.c,
                    groupValue: _language,
                    onChanged: (Language? newValue) {
                      setState(() {
                        _language = newValue;
                      });
                    },
                  ),
                ),

                /*Row(
                  children: [
                    RadioListTile(value: "dart", groupValue: language, onChanged: (newValue) {
                      setState(() {
                        language = newValue.toString();
                      });
                    })
                  ],
                )*/
              ],
            ),
          ],
        ),)
      ,
    );
  }

  updateSecret() {
    setState(() => textButtonPressed = !textButtonPressed);
    /*setState(() {
      textButtonPressed = (textButtonPressed == false) ? true : false;
      print("pressed");
    })*/
  }

  updateSecretDisplay() {
    return (textButtonPressed) ? secret : "";
  }

  updateGender() {
    return (switchGenderValue) ? "Féminin" : "Masculin";
  }

  Column checksHobbies() {
    List<Widget> items = [];
    hobbies.forEach((hobbie, checkOrNot) {
      Widget row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(left: 10), child: Text(hobbie),),
          Checkbox(value: checkOrNot, onChanged: ((newValue) {
            setState(() {
              hobbies[hobbie] = newValue ?? false;
            });
          }))
        ],
      );
      items.add(row);
    });
    return Column(children: items,);
  }

  Row dispHobbies() {
    List<Widget> items = [];
    hobbies.forEach((hobbie, checkOrNot) {
      if (checkOrNot == true) {
        Widget text = Text(" $hobbie", style: TextStyle(fontSize: 25),)
        ;
        items.add(text);
      }
    });
    return Row(children: items,);
  }


Column userInfos (TextEditingController controller, String text, bool password, String cache) {
  return Column(
    children: [
      TextField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(hintText: text),
      )
    ],
  );
}
  /*Column(
    children: [
      TextField(
        obscureText: password,
        controller: controller,
        decoration: InputDecoration(hintText: text),
        onChanged: (newString) {
          //setState(() {
            //prenom = newString;
        }
        ,)
    ],
  );*/

}