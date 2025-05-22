import 'package:flutter/material.dart';
import 'package:students_api/model/student_model.dart';
import 'package:students_api/service/api_service.dart';

class StudentMarksScreen extends StatefulWidget {
  const StudentMarksScreen({super.key});

  @override
  State<StudentMarksScreen> createState() => _StudentMarksScreenState();
}

class _StudentMarksScreenState extends State<StudentMarksScreen> {
  final studentNameController = TextEditingController();
  final marathiController = TextEditingController();
  final hindiController = TextEditingController();
  final englishController = TextEditingController();
  final scienceController = TextEditingController();
  final historyController = TextEditingController();

  final StudentService _studentService = StudentService();

  int totalMarks = 0;
  double percentage = 0.0;
  String result = 'Pass';

  void calculateTotal() {
    int marathi = int.tryParse(marathiController.text) ?? 0;
    int hindi = int.tryParse(hindiController.text) ?? 0;
    int english = int.tryParse(englishController.text) ?? 0;
    int science = int.tryParse(scienceController.text) ?? 0;
    int history = int.tryParse(historyController.text) ?? 0;

    setState(() {
      totalMarks = marathi + hindi + english + science + history;
      percentage = (totalMarks / 500) * 100;

      result =
          (marathi < 35 ||
                  hindi < 35 ||
                  english < 35 ||
                  science < 35 ||
                  history < 35)
              ? 'Fail'
              : 'Pass';
    });
  }

  void saveStudentData() async {
    if (studentNameController.text.isEmpty ||
        marathiController.text.isEmpty ||
        hindiController.text.isEmpty ||
        englishController.text.isEmpty ||
        scienceController.text.isEmpty ||
        historyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields are required!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final student = StudentsModel(
      name: studentNameController.text.trim(),
      marathiMarks: int.parse(marathiController.text.trim()),
      hindiMarks: int.parse(hindiController.text.trim()),
      englishMarks: int.parse(englishController.text.trim()),
      scienceMarks: int.parse(scienceController.text.trim()),
      historyMarks: int.parse(historyController.text.trim()),
    );

    final addedStudent = await _studentService.addStudent(student);

    if (addedStudent != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student added successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, addedStudent);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add student.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students Marks',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: studentNameController,
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              buildSubjectRow('• Marathi', marathiController),
              buildSubjectRow('• Hindi', hindiController),
              buildSubjectRow('• English', englishController),
              buildSubjectRow('• Science', scienceController),
              buildSubjectRow('• History', historyController),
              const SizedBox(height: 20),
              Text(
                'Total Marks: $totalMarks',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Percentage: ${percentage.toStringAsFixed(2)}%',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Result: $result',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: result == 'Fail' ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: saveStudentData,
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubjectRow(String subject, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$subject :', style: const TextStyle(fontSize: 24)),
          SizedBox(
            width: 100,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              onChanged: (value) => calculateTotal(),
            ),
          ),
        ],
      ),
    );
  }
}
