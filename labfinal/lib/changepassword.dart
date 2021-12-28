import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:labfinal/login.dart';
import 'package:labfinal/methods.dart';

class chnage extends StatefulWidget {
  const chnage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => myloginstate();
}

class myloginstate extends State<chnage> {
  final curentuser = FirebaseAuth.instance.currentUser;
  @override
  String email = "";
  String password = "";
  String name = "";
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.amber.shade700, width: 3),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelText: "Enter you'r New password",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 40,
                      child: RaisedButton(
                        hoverColor: Colors.amber[800],
                        color: Colors.amber,
                        onPressed: () async {
                          await curentuser!.updatePassword(password);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content:
                                  Text("you'r password change login again")));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                          //  createAccount(name, email, password);
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
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
