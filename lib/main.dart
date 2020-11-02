import 'package:flutter/material.dart';
import 'package:movies_app/core/services/firebaseAuthService.dart';
import 'package:movies_app/ui/pages/connectionPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/ui/shared/sizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          SizeConfig().init(constraints);
          return Provider<FirebaseAuth>.value(
              value: AuthService().createFirebaseAuthInstance(),
              builder: (context, widget) {
              return MaterialApp(
                title: 'Flutter Demo',
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
                home: ConnectionPage(),
              );
            }
          );
        }
      );
  }


  //TODO implement this FutureBuilder without error

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //       future: initializeFlutterFire(),
  //       builder: (context, snapshot){
  //         if(snapshot.hasData){
  //           return LayoutBuilder(
  //               builder: (context, constraints) {
  //                 SizeConfig().init(constraints);
  //                 return Provider<FirebaseAuth>.value(
  //                     value: AuthService().createFirebaseAuthInstance(),
  //                     builder: (context, widget) {
  //                       return MaterialApp(
  //                         title: 'Flutter Demo',
  //                         theme: ThemeData(
  //                           // This is the theme of your application.
  //                           //
  //                           // Try running your application with "flutter run". You'll see the
  //                           // application has a blue toolbar. Then, without quitting the app, try
  //                           // changing the primarySwatch below to Colors.green and then invoke
  //                           // "hot reload" (press "r" in the console where you ran "flutter run",
  //                           // or simply save your changes to "hot reload" in a Flutter IDE).
  //                           // Notice that the counter didn't reset back to zero; the application
  //                           // is not restarted.
  //                           primarySwatch: Colors.blue,
  //                         ),
  //                         home: ConnectionPage(),
  //                       );
  //                     }
  //                 );
  //               }
  //           );
  //         }
  //         return Text("Firebase est en train de s'initialiser",
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 25
  //           ),);
  //
  //       }
  //   );
  // }
}