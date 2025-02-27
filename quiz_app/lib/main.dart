import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz()
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  //class 

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  //class variables 
  int groupValue = 2;
  //currentQuestion is used to iterate the array/list 
  int currentQuestion = 0;
  //questions[currentQuestion] questions[0]
  //keep track of the score 
  int score = 0;
  var questions = ['this is question 1','this is question 2','this is question 3'];
  var answers = [0,0,1];
  //display correct / incorrect 
  String result = "";

  // class methods
  void checkAnswer(int answer) {

    print('User answered $answer');

    if(answers[currentQuestion] == answer) {
      //correct 
      print("Correct");
      score++;
      result = "Correct!";
    } else {
      print("incorrect");
      result = "Incorrect!";
      
    }
    //if answer is true or false, set the score and show the result correct/incorrect 
    //set the groupValue to activate the radio  
    setState((){
    groupValue = answer; 
    });
    


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent, 
        title: Text("Quiz App"),),
        body: Padding(
          padding: EdgeInsets.all(36.6),
          child: Column(
            children: <Widget>[
              Text(questions[currentQuestion]),
              Row(children: <Widget>[
                Radio(value: 1, groupValue: groupValue, onChanged: (e)=>{ checkAnswer(e!)}),
                Text("True"),
                Radio(value: 0, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
                Text("False"),
              ],),
              TextButton(onPressed: ()=>{ setState(() {
                currentQuestion++; //currentQuestion = currentQuestion + 1 or currentQuestion += 1
                groupValue = 2;
                result = "";
              })}, child: Text("Next")),
              Text(result),
              Text("Score: $score"),
              
            ],
          ),),
    );
  }
}