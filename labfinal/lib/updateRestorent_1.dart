// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/listpage.dart';
import 'package:labfinal/methods.dart';
import 'package:labfinal/student_list.dart';

class updateRestorents extends StatefulWidget {
  final String id;
  const updateRestorents({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => updateRestorent();
}

class updateRestorent extends State<updateRestorents> {
  @override
  String location = "";
  String contact = "";
  String name = "";
  @override
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formkey,
            child: Center(
                child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance
                  .collection('Restorents')
                  .doc(widget.id)
                  .get(),
              builder: (__, snapshots) {
                if (snapshots.hasError) {
                  print("errors");
                }
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var data = snapshots.data!.data();
                name = data!['name'];
                contact = data['contact'];
                location = data['location'];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350.0,
                      height: 600.0,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(color: Colors.amber.shade700, width: 3),
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
                          TextFormField(
                            initialValue: name,
                            autocorrect: false,
                            autofocus: true,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                            decoration: InputDecoration(
                              focusColor: Colors.black54,
                              prefixIcon: Icon(Icons.perm_identity,
                                  color: Colors.amber[700]),
                              labelText: "Enter you'r Restorent name",
                              border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                            ),
                            onChanged: (value) => name = value,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            initialValue: location,
                            autocorrect: false,
                            autofocus: true,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_location,
                                  color: Colors.amber[700]),
                              labelText: "Enter Restorent Location ",
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => location = value,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            initialValue: contact,
                            autocorrect: false,
                            autofocus: true,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone_bluetooth_speaker,
                                  color: Colors.amber[700]),
                              labelText: "Enter Contact Number ",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => contact = value,
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
                                  hoverColor: Colors.amber[900],
                                  color: Colors.amber[700],
                                  onPressed: () async {
                                    //  createAccount(name, email, password);
                                    CollectionReference add1 = FirebaseFirestore
                                        .instance
                                        .collection('Restorents');
                                    add1.doc(widget.id).update({
                                      'name': name,
                                      'location': location,
                                      'contact': contact
                                    });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PostsScreen()),
                                    );
                                  },
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.white,
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
                );
              },
            ))));
  }
}
