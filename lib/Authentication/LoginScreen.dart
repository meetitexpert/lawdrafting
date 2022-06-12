// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lawdrafting/MainScreens/HomeScreen.dart';
import 'package:lawdrafting/Utils/DialogTools.dart';

class LoginVC extends StatefulWidget {
  const LoginVC({Key? key}) : super(key: key);

  @override
  State<LoginVC> createState() => _LoginVCState();
}

class _LoginVCState extends State<LoginVC> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: ListView(
        children: [
          Image(
            image: AssetImage('appLogo.png'),
            width: 300,
            height: 300,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Sing In'),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    DialogTools.alertDialg(
                        'Ok', 'Please enter username', "", context);
                    return;
                  } else if (passwordController.text.isEmpty) {
                    DialogTools.alertDialg(
                        'Ok', 'Please enter password', "", context);
                    return;
                  }

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              )),
        ],
      ),
    );
  }
}
