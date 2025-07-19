import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  bool isAnswerCorrect(String userAnwser, String correctAnwser) {
    return userAnwser == correctAnwser;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = isAnswerCorrect(data['user_anwser'] as String, data['correct_anwser'] as String );
            return Row(
              children: [
                Container(
                  padding: EdgeInsetsGeometry.all(15),
                  decoration: isCorrect
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                        ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_anwser'] as String,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: isCorrect ? Colors.green : Colors.orangeAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        data['correct_anwser'] as String,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
