import 'package:databasedemo/loginform_sqflite/dbsuccess.dart';
import 'package:databasedemo/loginform_sqflite/login_sql_helper.dart';
import 'package:databasedemo/loginform_sqflite/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage_3(),
  ));
}

class LoginPage_3 extends StatefulWidget {
  @override
  State<LoginPage_3> createState() => LoginPage_3_State();
}

class LoginPage_3_State extends State<LoginPage_3> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void>  _userLogin() async {
    var result = await LoginSQLHelper.getUser(emailController.text, passController.text);
    if(result == "1"){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DbSuccess()));

    }else {
      Fluttertoast.showToast(msg: "login Failed");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Container(
          width: 500,
          height: 900,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 450, 10),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: const Text(
                        "X",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 40, 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.cyan)),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.cyan,
                          ),
                          hintText: "EMAIL",
                          hintStyle: TextStyle(
                              color: Colors.black12,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 2, color: Colors.cyan),
                              borderRadius:
                              BorderRadius.all(Radius.circular(30)))),

                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: '#',
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.cyan,
                          ),
                          hintText: "PASSWORD",
                          hintStyle: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.cyan,
                                  style: BorderStyle.solid),
                              borderRadius:
                              BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 80, 4, 5),
                    child: MaterialButton(
                      onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DbSuccess()));
                        emailController.text = "";
                        passController.text = "";
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Colors.cyan,
                      height: 60,
                      minWidth: 490,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage_3()));

                  }, child: Text("Not a user SignUp?")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
