import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    title: "Entertain-Mate",
    theme: new ThemeData(primaryColor: Colors.blue),
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Entertain-Mate"),
      ),
      body: MyCustomForm(),
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
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
                                  borderRadius: new BorderRadius.circular(5.0),
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
                                  Firestore.instance
                                      .collection('student')
                                      .document('38uZzDzzBTJrw42lWyot')
                                      .get()
                                      .then((documentSnapshot) {
                                        // str.data.forEach(f);
                                        documentSnapshot.data.forEach((k,v) => print('${k}: ${v}'));
                                        // var data = documentSnapshot.data();
                                        // str.data.forEach( doc {doc.data.toString();});
                                        // print(str);
                                      });

                                  if (_formKey.currentState.validate()) {
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(content: Text('Login . . .')));
                                    _formKey.currentState.save();
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
                                        builder: (context) => new SignUp()),
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  new Image.asset("assets/images/friends.png")
                ],
                // ),
              ))),
    );
  }
}
