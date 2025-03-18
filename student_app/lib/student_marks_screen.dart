import 'package:flutter/material.dart';

class StudentMarksScreen extends StatefulWidget {
  StudentMarksScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students Marks',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: studentNameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              buildSubjectRow('• Marathi', marathiController),
              buildSubjectRow('• Hindi', hindiController),
              buildSubjectRow('• English', englishController),
              buildSubjectRow('• Science', scienceController),
              buildSubjectRow('• History', historyController),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed:(){
                  
                }, child: Text('Save',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),),
              )
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
          Text('$subject :', style: TextStyle(fontSize: 24)),
          SizedBox(
            width: 100,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
