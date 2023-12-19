import 'package:flutter/material.dart';

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
    Icon(Icons.check),
    Icon(Icons.close),
  ];
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
                'This is where questions will be displayed',
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
                setState(() {
                  scroekeeper.add(
                    Icon(Icons.check),
                  );
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
                setState(() {});
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
