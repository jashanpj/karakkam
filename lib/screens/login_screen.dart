import 'package:flutter/material.dart';
import 'package:karakkam/util/styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Login",
        theme: new ThemeData(
            primarySwatch: Colors.yellow
        ),
        home: new Scaffold(
          backgroundColor: primary,

          body: _buildLiginScreenbody(),
        )
    );
  }

  Widget _buildLiginScreenbody() {
    return new Column(

      children: <Widget>[
        new Text("Hello"),
        new DecoratedBox(decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("login_image1.jpg", package: 'assets'))
        ))

      ],
    );
  }
}