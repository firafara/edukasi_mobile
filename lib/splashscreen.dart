import 'package:edukasi_mobile/page_login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:edukasi_mobile/home.dart';


class SplashScreen extends StatefulWidget{

  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen>{

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageLogin()),
      );
    });
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/background.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.library_books,
                  size: 150.0,
                  color: Colors.white,
                ),
                SizedBox(height: 24.0,),
                Text(
                  "EduApp",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(height: 24.0,),
                Text(
                  "Selalu up to date: Berita di ujung jari Anda!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

}