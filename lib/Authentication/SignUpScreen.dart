// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lawdrafting/Utils/DialogTools.dart';

class SignUpVC extends StatefulWidget {
  const SignUpVC({Key? key}) : super(key: key);

  @override
  State<SignUpVC> createState() => _SignUpVCState();
}

class _SignUpVCState extends State<SignUpVC> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
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
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
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
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Sing Up'),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    DialogTools.alertDialg(
                        'Ok', 'Please enter username', "", context);
                  } else if (passwordController.text.isEmpty) {
                    DialogTools.alertDialg(
                        'Ok', 'Please enter password', "", context);
                  } else if (emailController.text.isEmpty) {
                    DialogTools.alertDialg(
                        'Ok', 'Please enter email', "", context);
                  }
                },
              )),
        ],
      ),
    );
  }
}
