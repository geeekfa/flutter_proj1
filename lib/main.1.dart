import 'package:flutter/material.dart';

void main() {
  runApp(new FirstPage());
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Entertain-Mate",
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Entertain-Mate"),
          ),
          body: new Center(
              child: new Container(
            width: 200.0,
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "UserName",
                    contentPadding: EdgeInsets.all(10.0),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new TextField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    contentPadding: EdgeInsets.all(10.0),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new SizedBox(
                    width: double.infinity,
                    child: new RaisedButton(
                      child: const Text('Login'),
                      color: Theme.of(context).buttonColor,
                      elevation: 10.0,
                      splashColor: Colors.grey,
                      onPressed: () {
                        // Perform some action
                      },
                    )),
                Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Container(
                  alignment: Alignment.centerLeft,
                    child: new FlatButton(
                      child: const Text('I am New!'),
                      textColor: Colors.blue,
                      
                      // splashColor: Colors.grey,
                      onPressed: () {
                        // Perform some action
                      },
                    )),
              ],
            ),
          ))),
    );
  }
}