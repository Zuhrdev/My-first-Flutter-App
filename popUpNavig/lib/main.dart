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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color btnColor = Colors.greenAccent;
  Color appBarColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Montrer un snackbar',
            ),
            Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 50), child:
                FloatingActionButton(
                  onPressed: () {
                    final snackbar = const SnackBar(content: Text('Mon premier Snackbar'));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },

                  tooltip: 'Increment',
                  child: const Text("first"),
                ),),
                Padding(padding: const EdgeInsets.only(top: 50), child:
                FloatingActionButton(
                  backgroundColor: btnColor,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(createSnack(text: "Snack evolué"));
                  },
                  tooltip: 'Increment',
                  child: const Text('second'),
                ),),
                Padding(padding: const EdgeInsets.only(top: 50), child:
                    ElevatedButton(
                      onPressed: () {
                        AlertDialog alert = AlertDialog(
                          title: const Text("Big alert title"),
                          content: const Text("big alerte crée content"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("ok"),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop;
                                  setState(() {
                                    appBarColor = (appBarColor == Colors.lightBlueAccent) ? Colors.black : Colors.lightBlueAccent;
                                  });

                                },
                                child: const Text("changer le appbar"))
                          ],
                        );
                          showDialog(
                            barrierDismissible: false, // permet de fermer l'alert en cliquant nimp ou
                            context: context,
                            builder: (BuildContext ctx) {
                              return alert;
                            });
                      },
                      child: const Text("Montrer une alerte"),
                ),),
                Padding(padding: const EdgeInsets.only(top: 50), child:
                  ElevatedButton(
                      onPressed: (){
                        showMyDialog(dialog: createAlert());
                      },
                    child: const Text("Montrer une alerte-2"),
                  )),
                Padding(padding: const EdgeInsets.only(top: 50),child:
                  ElevatedButton(
                    onPressed: (){
                      showMyDialog(dialog: createSimp());
                    },
                    child: const Text("Montrer simple"),),)
              ],
            )

          ],
        ),
      ),

    );
  }

  SnackBar createSnack({required String text}) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.house),
        Text(text),
      ],
    );
    final snack = SnackBar(
        content: content,
      action: SnackBarAction(
        label: "changer couleur btr",
        onPressed: () {
          setState(() {
            btnColor= (btnColor == Colors.greenAccent) ? Colors.redAccent : Colors.greenAccent;
          });
        },
        textColor: Colors.red,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.green,
      elevation: 8,
      behavior: SnackBarBehavior.floating,
    );
    return snack;
  }

  AlertDialog createAlert() {
    return AlertDialog(
      title: const Text("Big alert title"),
      content: const Text("big alerte crée content"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("ok"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop;
              setState(() {
                appBarColor = (appBarColor == Colors.lightBlueAccent) ? Colors.black : Colors.lightBlueAccent;
              });

            },
            child: const Text("changer le appbar"))
      ],
    );
  }

  Future <void> showMyDialog({required Widget dialog}) async {
    await showDialog(
        barrierDismissible: false, // permet de fermer l'alert en cliquant nimp ou
        context: context,
        builder: (BuildContext ctx) {
          return dialog;
        });
  }

  SimpleDialog createSimp() {
    final simple = SimpleDialog(
      title: const Text("Je suis un simple dialog"),
      elevation: 15,
      children: [
        const Text("Je suis comme une column"),
        const Divider(),
        const Text("je suis dans un pop up"),
        option(),
      ],
    );
    return simple;
  }

  SimpleDialogOption option() {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }


}
