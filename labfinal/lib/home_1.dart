import 'dart:developer';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/changepassword.dart';
import 'package:labfinal/listselectedcategory.dart';
import 'package:labfinal/login.dart';
import 'package:labfinal/student_list.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class Home_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => home1();
// TODO: implement createState

}

class home1 extends State<Home_screen> {
  String email = FirebaseAuth.instance.currentUser!.email!;
//  String name = FirebaseAuth.instance.currentUser!.displayName!;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);

    ShapeBorder shapeBorder;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: new Center(
            child: Text(
          " Select Categorie",
          style: TextStyle(color: Colors.white),
        )),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Card(
              child: UserAccountsDrawerHeader(
                accountName: Text("Arslan"),
                accountEmail: Text("  ${email} "),
                onDetailsPressed: () {},
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.difference,
                  color: Colors.white30,

                  /* image:  DecorationImage(
               //   image:  ExactAssetImage('assets/images/lake.jpeg'),
                  fit: BoxFit.cover,
                ),*/
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.fakenamegenerator.com/images/sil-female.png")),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("wishlist"),
                      onTap: () {}),
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.lock),
                      title: Text("Change Password "),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => chnage()));
                      }),
                ],
              ),
            ),
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Restorents Details"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostsScreen()));
                      }),
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.help),
                      title: Text("Help"),
                      onTap: () {}),
                ],
              ),
            ),
            Card(
              elevation: 4.0,
              child: ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.redAccent, fontSize: 17.0),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  }),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 180.0,

                    child: Card(
                        child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lista(
                                      category: "Restorents",
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Restorents"),
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/food.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    )),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                Container(
                  height: 10.0,
                  width: 20.0,
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 180.0,
                    height: 180,
                    child: Card(
                        child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lista(
                                      category: "Groceries",
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Groceries"),
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/groceries.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    )),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
              ],
            ),
            Container(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 180.0,

                    child: Card(
                        child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lista(
                                      category: "Doctors",
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Doctors"),
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/Doctor.PNG',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    )),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                Container(
                  height: 10.0,
                  width: 20.0,
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 180.0,
                    height: 180,
                    child: Card(
                        child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lista(
                                      category: "Cab Booking",
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Cab Booking"),
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/CabBooking.PNG',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    )),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 180.0,

                    child: Card(
                        child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lista(
                                      category: "Labor",
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Labor"),
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/labor.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    )),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                Container(
                  height: 10.0,
                  width: 20.0,
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 180.0,
                    height: 180,
                    child: Card(
                        child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lista(
                                      category: "Mechanics",
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Mechanics"),
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/mechanic.PNG',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    )),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 180.0,

                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/grthre.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                Container(
                  height: 10.0,
                  width: 20.0,
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 180.0,
                    height: 180,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/grtwo.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child: Container(
                    width: 180.0,

                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/grthre.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                Container(
                  height: 10.0,
                  width: 20.0,
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 180.0,
                    height: 180,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 150.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/grtwo.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          /*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*/
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
      );
}
