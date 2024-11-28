import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/model/submission.dart';
import 'package:quiz_app/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.quiz,
      required this.submission,
      required this.restartQuiz});

  final Quiz quiz;
  final Submission submission;
  final VoidCallback restartQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You answered ${submission.calculateScore()} on ${quiz.questions.length}!",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(height: 30),
        Column(
          children: [
            ...submission.answers.map((answer) => Column(
                  children: [
                    Text(answer.question.title,
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...answer.question.possibleAnswers.map(
                          (eachPossibleAnswer) {
                            return Text(
                              eachPossibleAnswer,
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ),
        SizedBox(height: 20),
        AppButton("Restart quiz?", onTap: restartQuiz)
      ],
    );
  }
}
