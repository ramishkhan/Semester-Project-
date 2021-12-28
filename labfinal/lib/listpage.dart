import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/addRestorents.dart';
import 'package:labfinal/signup.dart';
import 'package:labfinal/updateRestorent.dart';

class listpage extends StatefulWidget {
  listpage({Key? key}) : super(key: key);

  @override
  lists1 createState() => lists1();
}

class lists1 extends State<listpage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> studentslist =
        FirebaseFirestore.instance.collection('Restorents').snapshots();
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
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(150),
                  2: FixedColumnWidth(100),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                          child: Container(
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text("Name"),
                        ),
                      )),
                      TableCell(
                          child: Container(
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text("contact"),
                        ),
                      )),
                      TableCell(
                          child: Container(
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text("Location"),
                        ),
                      )),
                      TableCell(
                          child: Container(
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text(""),
                        ),
                      )),
                    ],
                  ),
                  for (var i = 0; i <= lists1.length - 1; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                            child: Container(
                          child: Center(
                            child: Text(lists1[i]['name']),
                          ),
                        )),
                        TableCell(
                            child: Container(
                          child: Center(
                            child: Text(lists1[i]['contact']),
                          ),
                        )),
                        TableCell(
                            child: Container(
                          child: Center(
                            child: Text(lists1[i]['location']),
                          ),
                        )),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          updateRestorents(id: lists1[i]['id']),
                                    ),
                                  )
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  String id = lists1[i]['id'];
                                  CollectionReference delete = FirebaseFirestore
                                      .instance
                                      .collection('Restorents');
                                  delete.doc(id).delete();
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            ),
          );
        });

    // ignore: dead_code
  }
}
