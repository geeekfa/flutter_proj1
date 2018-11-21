import 'package:flutter/material.dart';
import 'signup.dart';
// import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(primaryColor: Colors.blue),
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  void _signin() async {
    try {
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
          email: _email, password: _password);
      String userId = user.uid;
      print('Signed in: $userId');
    } catch (e) {
      
      print('Error: $e');
    }
  }

  void _showDialog(String title,String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Entertain-Mate"),
      ),
      body: Form(
        key: _formKey,
        child: new Center(
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
                            new TextFormField(
                              decoration: new InputDecoration(
                                hintText: "Email",
                                contentPadding: EdgeInsets.all(10.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Please enter valid email';
                                else
                                  return null;
                              },
                              onSaved: (String val) {
                                _email = val;
                              },
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5.0)),
                            new TextFormField(
                                obscureText: true,
                                decoration: new InputDecoration(
                                  hintText: "Password",
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please choose a password';
                                  } else if (value.length < 4) {
                                    return 'More than 4 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (String val) {
                                  _password = val;
                                }),
                            Padding(padding: EdgeInsets.only(bottom: 5.0)),
                            new SizedBox(
                                width: double.infinity,
                                child: new RaisedButton(
                                  child: const Text('Login'),
                                  color: Theme.of(context).buttonColor,
                                  splashColor: Colors.grey,
                                  onPressed: () {
                                    // Firestore.instance
                                    //     .collection('student')
                                    //     .document('38uZzDzzBTJrw42lWyot')
                                    //     .get()
                                    //     .then((documentSnapshot) {
                                    //   documentSnapshot.data.forEach(
                                    //       (k, v) => print('${k}: ${v}'));
                                    // });

                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      _signin();
                                      _showDialog();
                                    } else {}
                                  },
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 5.0)),
                            new Container(
                                alignment: Alignment.centerLeft,
                                child: new FlatButton(
                                  child: const Text('I am New!'),
                                  textColor: Colors.blue,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              new SignupPage()),
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                    new Image.asset("assets/images/friends.png")
                  ],
                ))),
      ),
    );
  }
}
