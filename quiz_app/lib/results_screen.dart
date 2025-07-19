import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> selectedAnwsers;
  
  final void Function() onStartTheQuizOver;

  const ResultsScreen({super.key, required this.selectedAnwsers, required this.onStartTheQuizOver});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnwsers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_anwser': questions[i].answers[0],
        'user_anwser': selectedAnwsers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestions = summaryData.where((data) => data['correct_anwser'] == data['user_anwser']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You anwsered $numCorrectQuestions out of $numTotalQuestion questions correctly!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: Icon(Icons.arrow_back),
              onPressed: onStartTheQuizOver,
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
