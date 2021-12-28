import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:labfinal/listselectedcategory.dart';
import 'package:labfinal/splash.dart';

import 'package:labfinal/student_list.dart';

import 'changepassword.dart';
import 'package:labfinal/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _intialize = Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyD5hf71TaYbE5FoLjx_qYWmKemyeSqLZzk",
    appId: "1:1087897211632:android:49be114f86c9538f5de835",
    messagingSenderId: "1087897211632",
    projectId: "fghj-481dd",
  ));
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _intialize,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Smart Services',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: splashscreen1(),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
