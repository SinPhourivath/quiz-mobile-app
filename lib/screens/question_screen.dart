import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen(
      {super.key,
      required this.questions,
      required this.questionIndex,
      required this.onTap});

  final List<Question> questions;
  final int questionIndex;
  final void Function(String selectedAnswer) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questions[questionIndex].title,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(height: 30),
        Column(children: [
          ...questions[questionIndex].possibleAnswers.map((answer) => SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                      onPressed: () => onTap(answer),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                      child: Text(
                        answer,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )),
        ])
      ],
    );
  }
}
