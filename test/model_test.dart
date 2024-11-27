import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/model/submission.dart';

void main() {
  Quiz quiz = Quiz(
    title: "Programming Language Basics",
    questions: [
      const Question(
        title:
            "Which programming language is known as the 'language of the web'?",
        possibleAnswers: ["Python", "JavaScript", "C++", "Java"],
        goodAnswer: "JavaScript",
      ),
      const Question(
        title:
            "Which programming language is primarily used for Android app development?",
        possibleAnswers: ["Kotlin", "Swift", "Ruby", "PHP"],
        goodAnswer: "Kotlin",
      ),
      const Question(
        title: "What does the acronym 'SQL' stand for?",
        possibleAnswers: [
          "Structured Query Language",
          "Simple Query Language",
          "Standard Query Language",
          "System Query Language"
        ],
        goodAnswer: "Structured Query Language",
      ),
      const Question(
        title: "Which of the following is a low-level programming language?",
        possibleAnswers: ["C", "Python", "Ruby", "JavaScript"],
        goodAnswer: "C",
      ),
      const Question(
        title: "Who created the Python programming language?",
        possibleAnswers: [
          "Dennis Ritchie",
          "James Gosling",
          "Guido van Rossum",
          "Bjarne Stroustrup"
        ],
        goodAnswer: "Guido van Rossum",
      ),
    ],
  );

  List<Answer> answers = [
    Answer(question: quiz.questions[1], questionAnswer: "PHP"),
    Answer(question: quiz.questions[0], questionAnswer: "JavaScript"),
    Answer(question: quiz.questions[3], questionAnswer: "C"),
    Answer(question: quiz.questions[4], questionAnswer: "Bjarne Stroustrup"),
    Answer(question: quiz.questions[2], questionAnswer: "Structured Query Language")
  ];

  Submission submission = Submission(answers: answers);
  print(submission.calculateScore());
}
