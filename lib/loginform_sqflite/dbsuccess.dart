import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_sql_helper.dart';

class DbSuccess extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _DbSuccessState();

}

class _DbSuccessState extends State{

    late   String name = '';
   late   String email = '';

  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await LoginSQLHelper.getdata();
    setState(() {
      _journals = data;
      name = _journals[0]['name'];
      email = _journals[0]['email'];
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Db Success"),),
     body: Center(child: Column(
    children: [
      Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Text("Welcome $name",style: TextStyle(fontSize: 20,color: Colors.cyanAccent),),
      ),
      Container(
        height: 400,
        width: 400,
        child: Image(image: NetworkImage("https://thumbs.dreamstime.com/b/welcome-poster-spectrum-brush-strokes-white-background-colorful-gradient-brush-design-vector-paper-illustration-r-welcome-125370796.jpg",),fit: BoxFit.cover,),
      ),
    SizedBox(height: 30,),
    Text("your email is   $email",style: TextStyle(fontSize: 18,color: Colors.cyan),),
     ]),),
   );
  }

}