import 'package:flutter/material.dart';
import 'package:movies_app/core/services/firebaseAuthService.dart';
import 'package:movies_app/ui/pages/homePage.dart';
import 'package:movies_app/ui/shared/sizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';





class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  Color bgColor = Colors.red;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

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
                        controller: _emailController,
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
                            labelText: 'test@movieapp.com',
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
                          obscureText: true,
                          controller: _passwordController,
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
                            labelText: 'azerty',
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

                            try {
                              AuthService().signInMailandPassword(_emailController.text, _passwordController.text);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(builder: (_) => HomePage()),
                                );

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


