import 'package:flutter/material.dart';
import 'package:students_api/model/student_model.dart';
import 'package:students_api/service/api_service.dart';
import 'package:students_api/screens/students_detail_screen.dart';
import 'package:students_api/screens/students_marks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentsModel> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final data = await StudentService().fetchStudents();
    setState(() {
      students = data..sort((a, b) => b.percentage().compareTo(a.percentage()));
    });
  }

  Future<void> _addNewStudent() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentMarksScreen()),
    );

    if (result != null && mounted) {
      setState(() {
        students.add(result);
        students.sort((a, b) => b.percentage().compareTo(a.percentage()));
      });
    }
  }

  void _studentDetail(int index, StudentsModel student) async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailScreen(student: student, rank: index +1,),
      ),
    );

    if (updated != null) {
      setState(() {
        students[index] = updated;
        students.sort((a, b) => b.percentage().compareTo(a.percentage()));
      });
    }
  }
  void _confirmDelete(int index) async {
    final student = students[index];

    if (student.id == null) {
      _showSnackBar('Invalid student ID');
      return;
    }

    final shouldDelete = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Delete Student'),
            content: Text('Are you sure you want to delete ${student.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );

    if (shouldDelete == true) {
      final success = await StudentService().deleteStudent(student.id!);
      if (success && mounted) {
        setState(() => students.removeAt(index));
        _showSnackBar('${student.name} deleted');
      } else {
        _showSnackBar('Failed to delete student');
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Leaderboard',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body:
          students.isEmpty
              ? const Center(
                child: Text('No Student Data', style: TextStyle(fontSize: 20)),
              )
              : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    _buildHeaderRow(),
                    Expanded(child: _buildStudentList()),
                  ],
                ),
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _addNewStudent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Rank  ', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(
            'Percentage',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentList() {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            onTap: () => _studentDetail(index, student),
            leading: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            title: Text(
              student.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${student.percentage().toStringAsFixed(2)}%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  iconSize: 22,
                  onPressed: ()=> _studentDetail(index, student),
                ),
                
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  iconSize: 22,
                  onPressed: () => _confirmDelete(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
