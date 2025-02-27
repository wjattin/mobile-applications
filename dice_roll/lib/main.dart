import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const DiceRollMain());
}
// MaterialApp widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// End MaterialApp

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceNumber = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roll",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
             
          ),),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: TextButton(
        onPressed: () => setState(() {
          //Random.NextInt(n) returns a random valute between 0 and n-1 
            diceNumber = Random().nextInt(6) + 1;
            print(diceNumber);
          }), 
          child: Column(
            children: [
              Image.network('https://fastly.picsum.photos/id/374/200/300.jpg?hmac=O7_6jZztETgk8S2eFcdlCNlqe50qS5u-OW5hs-EoNMo')
,
              Image.asset("images/dice-$diceNumber.png"),
              Image.asset("images/dice-$diceNumber.png"),
              Text("Total of both dice")
            ],
          ) 
          //Image.asset("images/dice-$diceNumber.png")
          //Text("You rolled a: $diceNumber ")
          )
      ),
    );
  }
}
