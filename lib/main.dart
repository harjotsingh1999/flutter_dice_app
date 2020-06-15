import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.cyan,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 3;
  static AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset("images/dice$leftDiceNumber.png"),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset("images/dice$rightDiceNumber.png"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          RaisedButton(
            onPressed: () {
              player.play('roll.wav');
              setState(() {
                leftDiceNumber= Random().nextInt(6) + 1;
                rightDiceNumber= Random().nextInt(6) + 1;
                print('Button pressed left dice =$leftDiceNumber and right dice =$rightDiceNumber');
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal:20.0),

              child: Text(
                'Roll Dice',
                style: TextStyle(color: Colors.cyan, fontSize: 25.0),
              ),
            ),
            elevation: 5.0,
            padding: EdgeInsets.all(0.0),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
