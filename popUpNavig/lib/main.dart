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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

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
                Padding(padding: EdgeInsets.only(top: 100), child:
                FloatingActionButton(
                  onPressed: () {
                    final snackbar = SnackBar(content: Text('Mon premier Snackbar'));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },

                  tooltip: 'Increment',
                  child: Text("first"),
                ),),
                FloatingActionButton(
                  backgroundColor: btnColor,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(createSnack(text: "Snack evolué"));
                  },
                  tooltip: 'Increment',
                  child: Text('second'),
                ),
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
      ),
    );
    return snack;
  }


}
