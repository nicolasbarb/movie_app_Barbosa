import 'package:flutter/material.dart';
import 'package:movies_app/core/models/user.dart';
import 'package:movies_app/ui/pages/homePage.dart';
import 'package:movies_app/ui/shared/sizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  Color bgColor = Colors.red;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
        height: SizeConfig.screenHeight / 2,
        width: SizeConfig.screenWidth / 2,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onTap: () {
                  setState(() {
                    if(bgColor == Colors.red) bgColor = Colors.yellow;
                    if(bgColor == Colors.yellow) bgColor = Colors.yellow;
                  });
                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: bgColor)
                    ),
                    labelText: 'Mail',
                  labelStyle: TextStyle(
                    color: bgColor
                  )
                ),
                style: TextStyle(
                    color: Colors.white
                ),

                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      if(bgColor == Colors.red) bgColor = Colors.yellow;
                      if(bgColor == Colors.yellow) bgColor = Colors.yellow;
                    });
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: bgColor)
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: bgColor
                      ),
                  ),
                  style: TextStyle(
                    color: Colors.white
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              FlatButton(
                child: Text("Connexion"),
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FirebaseAuth.instance.onAuthStateChanged.listen((event) {


                    });
                    // Navigator.of(context).push(
                    //   MaterialPageRoute<void>(builder: (_) => HomePage()),
                    // );
                  }
                },
              ),

            ],
          ),
        ),
          ),
      )
    );
  }
}


