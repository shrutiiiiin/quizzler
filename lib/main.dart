import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'question.dart';
import 'quizBrain.dart';

Quizbrain quizbrain = Quizbrain();

void main() {
  runApp(quiz());
}

class quiz extends StatelessWidget {
  const quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Quizzler'),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: quizpage(),
        ),
      ),
    );
  }
}

class quizpage extends StatefulWidget {
  const quizpage({super.key});

  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  List<Icon> scroekeeper = [
    Icon(Icons.check, color: Colors.white),
    Icon(Icons.close, color: Colors.white),
  ];

  int questionNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.questionBank[questionNum] as String,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                bool correctans = quizbrain.questionBank[questionNum] as bool;

                if (correctans == false) {
                  Fluttertoast.showToast(
                      msg: "Your answer is correct !",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      textColor: Colors.white,
                      fontSize: 16);
                } else {
                  Fluttertoast.showToast(
                      msg: "WRONG ANSWER !",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      textColor: Colors.white,
                      fontSize: 16);
                }
                setState(() {
                  questionNum++;
                });
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                bool correctans = quizbrain.questionBank[questionNum] as bool;

                if (correctans == true) {
                  Fluttertoast.showToast(
                      msg: "Your answer is correct !",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      textColor: Colors.white,
                      fontSize: 16);
                } else {
                  Fluttertoast.showToast(
                      msg: "WRONG ANSWER !",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      textColor: Colors.white,
                      fontSize: 16);
                }
                setState(() {
                  questionNum++;
                });
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scroekeeper,
        ),
      ],
    );
  }
}
