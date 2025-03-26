import 'package:flutter/material.dart';
import 'package:student_app/model/students_model.dart';
import 'package:student_app/student_marks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentsModel> students = [];

  Future<void> navigateToStudentScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentMarksScreen()),
    );

    if (result != null && mounted) {
      setState(() {
        students.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students Score ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
          students.isEmpty
              ? Center(
                child: Text('No Student Data', style: TextStyle(fontSize: 20)),
              )
              : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(14.0),
                        title: Text(
                          'Name: ${student.name}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Total: ${student.totalMarks()}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              students.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: navigateToStudentScreen,
        child: Icon(Icons.person_add),
      ),
    );
  }
}
