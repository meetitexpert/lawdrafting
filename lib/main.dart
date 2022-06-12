// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawdrafting/MainScreens/HomeScreen.dart';
import 'package:lawdrafting/Utils/ColorTools.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils/AppTools.dart';
import 'Utils/ConstTools.dart';
import 'Utils/DeviceTools.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initSquarePayment();
  if (Platform.isIOS) {
    await _setIOSCardEntryTheme();
  }
  await AppTools.init();
  DeviceTools.init();
  ConstTools.prefs = await SharedPreferences.getInstance();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  runApp(const MyApp());
}

Future<void> _initSquarePayment() async {
  await InAppPayments.setSquareApplicationId(
      'sandbox-sq0idb-dLdppGXEmxjFBX4X3DK-mA');
}

Future _setIOSCardEntryTheme() async {
  var themeConfiguationBuilder = IOSThemeBuilder();
  themeConfiguationBuilder.saveButtonTitle = 'Pay';
  themeConfiguationBuilder.errorColor = RGBAColorBuilder()
    ..r = 255
    ..g = 0
    ..b = 0;
  themeConfiguationBuilder.tintColor = RGBAColorBuilder()
    ..r = 36
    ..g = 152
    ..b = 141;
  themeConfiguationBuilder.keyboardAppearance = KeyboardAppearance.light;
  themeConfiguationBuilder.messageColor = RGBAColorBuilder()
    ..r = 114
    ..g = 114
    ..b = 114;

  await InAppPayments.setIOSCardEntryTheme(themeConfiguationBuilder.build());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LAW Drafting',
        debugShowCheckedModeBanner: false,
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
          primarySwatch: ColorTools.applicationColor,
        ),
        home: const HomeScreen());
  }
}
