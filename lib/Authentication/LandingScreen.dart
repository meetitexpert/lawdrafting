// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lawdrafting/Authentication/LoginScreen.dart';
import 'package:lawdrafting/Authentication/SignUpScreen.dart';

import '../Utils/PixelTools.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PixelTools.init(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      body: ListView(
        children: [
          Image(
            image: AssetImage('appLogo.png'),
            width: 350,
            height: 350,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ElevatedButton(
                child: const Text('Sing Up Via Email'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpVC()));
                },
              )),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ElevatedButton(
                child: const Text('Sing In Via Email'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginVC()));
                },
              )),
        ],
      ),
    );
  }
}
