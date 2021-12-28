// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/home.dart';
import 'package:labfinal/listpage.dart';
import 'package:labfinal/listselectedcategory.dart';
import 'package:labfinal/methods.dart';
import 'package:labfinal/student_list.dart';

class Restorents extends StatefulWidget {
  const Restorents({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => myloginstate();
}

class myloginstate extends State<Restorents> {
  @override
  String location = "";
  String contact = "";
  String name = "";
  String email = "";

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350.0,
            height: 600.0,
            decoration: BoxDecoration(
              color: Colors.amber[700],
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.amber.shade700, width: 3),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Registration Form",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
                    focusColor: Colors.black54,
                    prefixIcon: Icon(Icons.perm_identity, color: Colors.white),
                    labelText: "Enter you'r Restorent name",
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    labelText: "Enter Restorent Email ",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_location, color: Colors.white),
                    labelText: "Enter Restorent Location ",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      location = value;
                    });
                  },
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
                    prefixIcon:
                        Icon(Icons.contact_phone_outlined, color: Colors.white),
                    labelText: "Enter Contact Number ",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      contact = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 40,
                      child: RaisedButton(
                        hoverColor: Colors.black12,
                        color: Colors.white,
                        onPressed: () async {
                          //  createAccount(name, email, password);
                          CollectionReference add1 = FirebaseFirestore.instance
                              .collection('Restorents');
                          add1.add({
                            'name': name,
                            'location': location,
                            'contact': contact,
                            'email': email
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_screen()),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
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
