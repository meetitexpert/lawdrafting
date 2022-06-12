// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lawdrafting/MainScreens/GeneralPowerOfAttorny.dart';
import 'package:lawdrafting/MainScreens/SpecialPowerOfAttorny.dart';
import 'package:lawdrafting/Utils/ColorTools.dart';
import '../Utils/PixelTools.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> optionsList = ['مختار \n عام', 'مختار \n خاص'];
  List screens = [GeneralPowerAttorny(), SpecialPowerAttorny()];

  @override
  Widget build(BuildContext context) {
    PixelTools.init(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        /*actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                ConstTools.signOutHandling(context);
              })
        ],*/
      ),
      body: Container(
          padding: EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: optionsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shadowColor: ColorTools.applicationColor.shade200,
                color: ColorTools.applicationColor.shade300,
                child: Center(
                    child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        ColorTools.applicationColor.shade300),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Text(
                    optionsList[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'JameelNoori',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => screens[index]));
                  },
                )),
              );
            },
          )),
    );
  }
}
