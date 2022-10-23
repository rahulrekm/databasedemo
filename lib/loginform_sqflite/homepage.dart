import 'package:databasedemo/loginform_sqflite/registerpage.dart';
import 'package:flutter/material.dart';



import 'loginpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage_3(),
  ));
}

class FirstPage_3 extends StatefulWidget {
  @override
  State<FirstPage_3> createState() => FirstPage_3_State();
}

class FirstPage_3_State extends State<FirstPage_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(300)),
              gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.cyanAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            width: 500,
            height: 900,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 60, 40, 10),
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(65))),
                    child: const Text(
                      "Go",
                      style: TextStyle(fontSize: 103, color: Colors.cyan),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(270, 0, 100, 5),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(35))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(180, 0, 100, 10),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage_3()));
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    color: Colors.white,
                    height: 60,
                    minWidth: 470,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 30, color: Colors.cyan),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage_3()));
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        side: BorderSide(color: Colors.white, width: 2)),
                    height: 60,
                    minWidth: 470,
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
