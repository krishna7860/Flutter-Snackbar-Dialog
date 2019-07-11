import 'package:flutter/material.dart';

import 'SubClass.dart';
import 'TabBar.dart';

void main() => runApp(new MaterialApp(
      title: "Utilities",
      home: HomePage(),
      routes: <String, WidgetBuilder>{
          "/a" : (BuildContext context) => new SubClass("Bottom App Bar"),
          "/b" : (BuildContext context) => new TabBarClass("Tab Bar"),
          },
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Snackbar|Dialog|Stepper"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  AlertDialog dialog = new AlertDialog(
    title: new Text("AlertBox"),
    content: new Text("AlertDialog Active"),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Snackbar"),
              onPressed: () => Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("Snackbar Pressed"),
                    duration: new Duration(seconds: 3),
                  )),
            ),
            new RaisedButton(
              child: new Text("Dialog"),
              onPressed: () => showDialog(context: context, child: dialog),
            ),
            new RaisedButton(
              child: new Text("BottomNavigationBar"),
              onPressed: (){

                Navigator.of(context).pushNamed("/a");
              }

            )
            ,  new RaisedButton(
                child: new Text("TabBar"),
                onPressed: (){

                  Navigator.of(context).pushNamed("/b");
                }

            )
//
          ],
        ),
      ),
    );
  }
}
