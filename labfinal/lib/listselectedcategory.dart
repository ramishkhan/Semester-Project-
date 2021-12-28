import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/changepassword.dart';
import 'package:labfinal/login.dart';
import 'package:labfinal/student_list.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class lista extends StatefulWidget {
  String category;
  lista({Key? key, required this.category}) : super(key: key);
  @override
  State<StatefulWidget> createState() => home1();
// TODO: implement createState

}

class home1 extends State<lista> {
  // String email = FirebaseAuth.instance.currentUser!.email!;
  // String name = FirebaseAuth.instance.currentUser!.displayName!;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);
    if (widget.category == "Restorents") ShapeBorder shapeBorder;
    final Stream<QuerySnapshot> studentslist =
        FirebaseFirestore.instance.collection(widget.category).snapshots();
    final List lists1 = [];
    return StreamBuilder<QuerySnapshot>(
        stream: studentslist,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> a = document.data() as Map<String, dynamic>;
            lists1.add(a);
            a['id'] = document.id;
          }).toList();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber[700],
              title: new Center(
                  child: Text(
                " ${widget.category}",
                style: TextStyle(color: Colors.white),
              )),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(children: <Widget>[
                  for (int i = 0; i <= lists1.length - 1; i++) ...[
                    Container(
                      height: 10.0,
                      width: 20.0,
                    ),
                    Container(
                      height: 170.0,
                      margin: EdgeInsets.only(left: 5.0),
                      child: Container(
                        color: Colors.black12,

                        width: 500.0,

                        child: Card(
                            color: Colors.white,
                            child: new InkWell(
                              hoverColor: Colors.white54,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.near_me),
                                        color: Colors.amber[700],
                                      ),
                                      Text("Name :"),
                                      Text(lists1[i]['name']),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.email),
                                        color: Colors.amber[700],
                                      ),
                                      Text("Email :"),
                                      Text(lists1[i]['email']),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add_location),
                                        color: Colors.amber[700],
                                      ),
                                      Text("Location :"),
                                      Text(lists1[i]['location']),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.phone),
                                        color: Colors.amber[700],
                                      ),
                                      Text("Contact Number :"),
                                      Text(lists1[i]['contact']),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        // description and share/explore buttons
                        // share, explore buttons
                      ),
                    ),
                    Container(
                      height: 20.0,
                      width: 20.0,
                    ),
                  ],
                ]),
              ),
            ),
          );
        });
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
      );
}
