import 'package:flutter/material.dart';
import 'package:students_api/model/student_model.dart';

class StudentDetailScreen extends StatelessWidget {
  final StudentsModel student;
  final int rank;

  const StudentDetailScreen({
    super.key,
    required this.student,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rank: $rank',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSubjectRow('• Marathi', student.marathiMarks),
                    buildSubjectRow('• Hindi', student.hindiMarks),
                    buildSubjectRow('• English', student.englishMarks),
                    buildSubjectRow('• Science', student.scienceMarks),
                    buildSubjectRow('• History', student.historyMarks),
                    const Divider(),
                    Text(
                      'Total Marks: ${student.totalMarks()} / 500',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Percentage: ${(student.totalMarks() / 500 * 100).toStringAsFixed(2)}%',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Result: ${student.result}',
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            student.result == 'Fail'
                                ? Colors.red
                                : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubjectRow(String subject, int marks) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        '$subject: $marks',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
