
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: new Center(
          child: new Container(
              padding: EdgeInsets.all(8.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Card(
                    elevation: 10.0,
                    child: new Container(
                      width: 230.0,
                      padding: EdgeInsets.all(8.0),
                      child: new Column(
                        children: <Widget>[
                          new TextField(
                            decoration: new InputDecoration(
                              hintText: "Email",
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
                                child: const Text('Sign up'),
                                color: Theme.of(context).buttonColor,
                                splashColor: Colors.grey,
                                onPressed: () {
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
                // ),
              ))),
    );
  }
}