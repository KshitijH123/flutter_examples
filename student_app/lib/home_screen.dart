import 'package:flutter/material.dart';
import 'package:student_app/student_marks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> studentsData = [];

  Future<void> navigateToStudentScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentMarksScreen()),
    );

    if (result != null && mounted) {
      setState(() {
        studentsData.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student App (${studentsData.length})',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
          studentsData.isEmpty
              ? Center(
                child: Text('No Student Data', style: TextStyle(fontSize: 20)),
              )
              : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: studentsData.length,
                  itemBuilder: (context, index) {
                    final student = studentsData[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(14.0),
                        title: Text(
                          'Name: ${student['name']}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Total: ${student['marks']['total']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              studentsData.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: navigateToStudentScreen,
      ),
    );
  }
}
