import 'package:flutter/material.dart';
import 'package:qizing_flutter/question.dart';

void main() => runApp(Quizzing());

class Quizzing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: Text(
            'Quizzing',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //List of the Icon
  List<Icon> scoreTracker = [
    // Icon(Icons.check, color: Colors.green),
    // Icon(Icons.close, color: Colors.red),
  ];

  // List<String> question = [
  //   'You can Lead a goat down stair but not up stair.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s  blood color are green.',
  // ];

  // Question q1 = Question(
  //   questionText: 'You can Lead a goat down stair but not up stair.',
  //   questionAnswer: true,
  // );
  // List<bool> answer = [false, true, true];

  List<Question> questionBank = [
    Question(
      questionText: 'You can Lead a goat down stair but not up stair.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Approximately one quarter of human bones are in the feet.',
      questionAnswer: true,
    ),
    Question(
      questionText: 'A slug\'s  blood color are green.',
      questionAnswer: true,
    ),
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  scoreTracker.add(Icon(Icons.check, color: Colors.green));
                  print('user got it right');
                } else {
                  scoreTracker.add(Icon(Icons.close, color: Colors.red));
                  print('user got it wrong');
                }

                setState(() {
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer =
                      questionBank[questionNumber].questionAnswer;
                  if (correctAnswer == false) {
                    scoreTracker.add(Icon(Icons.check, color: Colors.green));
                    print('user got it right');
                  } else {
                    scoreTracker.add(Icon(Icons.close, color: Colors.red));
                    print('user got it wrong');
                  }

                  questionNumber++;
                });

                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children: scoreTracker),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
