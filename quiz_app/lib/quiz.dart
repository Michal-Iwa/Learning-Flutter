import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnwser(String anwser) {
    selectedAnswers.add(anwser);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }

  }
  void startTheQuizOver() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnwser: chooseAnwser);
    }
    else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(selectedAnwsers: selectedAnswers, onStartTheQuizOver: startTheQuizOver,);
    }
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 67, 83, 91), Color.fromARGB(255, 58, 93, 109)]),
          ),
          child: screenWidget
        ),
      ),
    );
  }
}
