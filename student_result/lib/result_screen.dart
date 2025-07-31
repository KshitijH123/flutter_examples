import 'package:flutter/material.dart';
import 'package:student_result/students.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.student});

  final Student student;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final student = widget.student;

    int total =
        student.marathi + student.hindi + student.english + student.science;

    double percentage = total / 5;

    bool isPassed =
        student.marathi >= 35 &&
        student.hindi >= 35 &&
        student.english >= 35 &&
        student.maths >= 35 &&
        student.science >= 35;

    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${student.name}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            if (isPassed)
              Text(
                'Percentage : ${percentage.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 16),
            Text(
              isPassed ? "Result : Passed" : "Result: Fail",
              style: TextStyle(fontSize: 24,color: isPassed ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
