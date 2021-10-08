import 'package:e_commerce/categories.dart';
import 'package:e_commerce/post.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/register.dart';
import 'package:e_commerce/home.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'post.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return  MaterialApp(
         home: Categories(),
         routes: {
           "/register":(context) => Register(),
           "/home":(context) => Home(),
             "/post":(context) => Post()
         },
    );
;
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
  }

