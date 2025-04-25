import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double area = 0;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();

  void calculateArea() {
    final heigthStr = heightController.text.trim();
    final height = double.tryParse(heigthStr) ?? 0;
    final widthStr = widthController.text.trim();
    final width = double.tryParse(widthStr) ?? 0;

    area = 1 / 2 * height * width;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32,
            children: [
              const Center(child: Text('▲', style: TextStyle(fontSize: 132))),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              TextField(
                controller: widthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Width',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Area Of Triangle: \n $area',
                style: TextStyle(fontSize: 24),
                maxLines: 2,
              ),

              ElevatedButton(
                onPressed: calculateArea,
                child: const Text('Calculate Area'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
