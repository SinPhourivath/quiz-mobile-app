import 'package:flutter/material.dart';
import 'package:quiz_app/model/submission.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/welcome_screen.dart';
import 'model/quiz.dart';

enum QuizState { notStard, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState currentState = QuizState.notStard;
  int currentQuestionIndex = 0;
  Submission? submission;

  void startQuiz() {
    submission = Submission(answers: []);

    setState(() {
      currentState = QuizState.started;
    });
  }

  void onTap(String choice) {
    submission!.answers.add(Answer(
        question: widget.quiz.questions[currentQuestionIndex],
        questionAnswer: choice));

    if (currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        currentState = QuizState.finished;
      });
    }
  }

  void restart() {
    currentQuestionIndex = 0;
    submission!.answers.clear();

    setState(() {
      currentState = QuizState.notStard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: switch (currentState) {
            QuizState.notStard => WelcomeScreen(
                startQuiz: startQuiz,
                quizName: widget.quiz.title,
              ),
            QuizState.started => QuestionScreen(
                questions: widget.quiz.questions,
                questionIndex: currentQuestionIndex,
                onTap: onTap),
            QuizState.finished => ResultScreen(
                quiz: widget.quiz,
                submission: submission!,
                restartQuiz: restart)
          },
        ),
      ),
    );
  }
}
