import 'dart:io';

import 'package:flutter/material.dart';

import 'package:labfinal/ResetPasswordPage.dart';
import 'package:labfinal/home.dart';
import 'package:labfinal/signup.dart';

import 'package:flutter/gestures.dart';

import 'methods.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => myloginstate();
}

// ignore: camel_case_types
class myloginstate extends State<login> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[700],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 380.0,
                height: 400.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      autocorrect: false,
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          labelText: "Enter you'r name",
                          border: OutlineInputBorder()),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      autocorrect: false,
                      autofocus: true,
                      obscureText: true,
                      enableSuggestions: false,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          labelText: "Enter you'r password",
                          border: OutlineInputBorder()),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordPage()),
                        );
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black54,
                          decorationThickness: 3,
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 12.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 340,
                          height: 50,
                          child: FlatButton(
                            color: Colors.blueAccent,
                            onPressed: () {
                              login1(email, password).then((user) {
                                if (user != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home_screen()),
                                  );
                                }
                              });
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                        ),
                        FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login2()),
                            );
                          },
                          child: Text(
                            "Sign Up Now",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
