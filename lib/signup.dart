import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MaterialApp(
    home: SignupPage(),
  ));
}

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _handleSignIn() async {
    // GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    // GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // FirebaseUser user = await _auth.signInWithGoogle(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    // print("signed in " + user.displayName);
    // return user;

    // if (_validateAndSave()) {
    //   try {
    //     FirebaseUser user = await FirebaseAuth.instance
    //         .signInWithEmailAndPassword(email: _email, password: _password);
    //     print("Signed in ${user.uid}");
    //   } catch (e) {
    //     print('Error $e');
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Sign up"),
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
                                  child: const Text('Sign up'),
                                  color: Theme.of(context).buttonColor,
                                  splashColor: Colors.grey,
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      print(_email);
                                      //TODO: rigister user
                                      _handleSignIn();

                                      //                       firebase.auth().createUserWithEmailAndPassword(email, password)
                                      // .then(function (snapshot) {
                                      //     //sendEmailVerification
                                      //     var user = firebase.auth().currentUser;
                                      //     user.sendEmailVerification().then(function () {
                                      //         console.log('email sent.');
                                      //     }).catch(function (error) {
                                      //         console.log(error);
                                      //     });
                                      // })
                                      // .catch(function (error) {
                                      //     var errorCode = error.code;
                                      //     var errorMessage = error.message;
                                      //     console.log(errorCode + ':' + errorMessage);
                                      // });
                                    } else {}
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
