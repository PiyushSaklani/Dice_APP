import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int dicenumber = 0;
  int Diceview = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //* To get the size of the screen
    double vicwInset = MediaQuery.of(context)
        .viewInsets
        .bottom; //* To Know that keyboard is open or not
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: size.width * 0.02433, left: size.width * 0.02433),
                height: size.height * 0.06031,
                width: size.width * 0.12165,
                child: Image.asset("Images/Dice.png"),
              ),
              Container(
                margin: EdgeInsets.only(right: size.width * 0.31630),
                width: size.width * 0.20300,
                child: const Text(
                  "Dice",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () {
                  print(size.height);
                  setState(() {
                    if (Diceview == 1) {
                      Diceview = 2;
                    } else {
                      Diceview = 1;
                    }
                  });
                },
                child: SizedBox(
                  height: size.height * 0.04825,
                  width: size.width * 0.09732,
                  child: Image.asset("Images/View$Diceview.png"),
                ),
              )
            ],
          ),
        ),
        backgroundColor: const Color(0xFF311B92),
        shadowColor: Colors.black,
      ),
      body: Container(
        color: const Color(0xFF311B92),
        child: Center(
          child: FittedBox(
            child: FlatButton(
                onPressed: () {
                  print("Button Pressed");
                  setState(() {
                    dicenumber = Random().nextInt(6) + 1;
                  });
                },
                child: Diceview == 1
                    ? Image.asset("Images/D$dicenumber.png")
                    : Image.asset("Images/Dice$dicenumber.png")),
          ),
        ),
      ),
    );
  }
}
