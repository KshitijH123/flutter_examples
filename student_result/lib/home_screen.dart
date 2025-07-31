import 'package:flutter/material.dart';
import 'package:student_result/result_screen.dart';
import 'package:student_result/students.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController marathiController = TextEditingController();
  TextEditingController hindiController = TextEditingController();
  TextEditingController englishController = TextEditingController();
  TextEditingController mathsController = TextEditingController();
  TextEditingController scienceController = TextEditingController();

  void onButtonPressed() {
    final name = nameController.text;
    final marathi = int.parse(marathiController.text);
    final hindi = int.parse(hindiController.text);
    final english = int.parse(englishController.text);
    final maths = int.parse(mathsController.text);
    final science = int.parse(scienceController.text);

    final student = Student(
      name: name,
      marathi: marathi,
      hindi: hindi,
      english: english,
      maths: maths,
      science: science,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(student: student,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students App')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              Row(
                spacing: 16,
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  Text(
                    'Marathi:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: marathiController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  Text(
                    'Hindi:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: hindiController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  Text(
                    'English:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: englishController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  Text(
                    'Maths:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: mathsController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  Text(
                    'Science:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: scienceController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: Text('Show Result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
