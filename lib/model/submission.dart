import 'package:quiz_app/model/quiz.dart';

class Answer {
  Question question;
  String questionAnswer;

  Answer({required this.question, required this.questionAnswer});

  bool isCorrect() {
    return question.goodAnswer == questionAnswer;
  }
}

class Submission {
  List<Answer> answers;

  Submission({required this.answers});

  // Get the first answer that is related to this question - null if no answer
  // ...

  int calculateScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.isCorrect()) {
        score++;
      }
    }

    return score;
  }

  // Add answer?
  // ...

  void removeAnswer() {
    answers.clear();
  }
}
