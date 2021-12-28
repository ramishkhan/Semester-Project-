import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labfinal/methods.dart';

class login2 extends StatefulWidget {
  const login2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => myloginstate();
}

class myloginstate extends State<login2> {
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
                    labelText: "Enter you'r name",
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
                    labelText: "Enter you'r Email ",
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
                    labelText: "Enter you'r password ",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelText: "Repeat Password ",
                    border: OutlineInputBorder(),
                  ),
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
