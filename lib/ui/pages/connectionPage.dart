import 'package:flutter/material.dart';
import 'package:movies_app/ui/pages/homePage.dart';
import 'package:movies_app/ui/shared/sizeConfig.dart';

class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  Color bgColor = Colors.red;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
        height: SizeConfig.screenHeight / 2,
        width: SizeConfig.screenWidth / 2,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                onTap: () {
                  setState(() {
                    if(bgColor == Colors.red) bgColor = Colors.yellow;
                    if(bgColor == Colors.yellow) bgColor = Colors.yellow;
                    else bgColor = Colors.red;
                  });
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: bgColor)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: bgColor
                      )
                    ),
                    labelText: 'Mail',
                  labelStyle: TextStyle(
                    color: bgColor
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  decoration: InputDecoration(

                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                ),
              ),
              FlatButton(
                child: Text("Connexion"),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (_) => HomePage()),
                  );
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
