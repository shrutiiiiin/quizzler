import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  List<Icon> scorekeeper = [];

  void checkans(bool userans) {
    bool correctans = quizbrain.getQuestionAnswer();
    setState(() {
      if (quizbrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'you\'ve reached the end of quiz!',
        ).show();
        quizbrain.reset();
        scorekeeper = [];
      }
      if (correctans == userans) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        Fluttertoast.showToast(
            msg: "Your answer is correct !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            textColor: Colors.white,
            fontSize: 16);
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        Fluttertoast.showToast(
            msg: "WRONG ANSWER !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            textColor: Colors.white,
            fontSize: 16);
      }
      quizbrain.nextquestion();
    });
  }

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
                quizbrain.getQuestionText(),
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
                checkans(true);
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
                checkans(false);
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
