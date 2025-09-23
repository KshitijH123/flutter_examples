import 'package:flutter/material.dart';
import 'package:practice_app_sep23/model/triangle_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();

  double area = 0;
  List<TriangleModel> history = [];

  void calculateArea() {
    final double? height = double.tryParse(heightController.text.trim());
    final double? width = double.tryParse(widthController.text.trim());

    if (height != null && width != null) {
      final double calculatedArea = 0.5 * height * width;
      final TriangleModel triangle = TriangleModel(
        height,
        width,
        calculatedArea,
      );

      setState(() {
        area = calculatedArea;
        history.add(triangle);
        if (history.length > 5) {
          history.removeAt(0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Triangle Area Calculator",
        style: TextStyle(fontSize: 22,fontWeight:FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "▲",
                style: TextStyle(fontSize: 150, color: Colors.blue.shade700),
              ),
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: "Height",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: widthController,
              decoration: const InputDecoration(
                labelText: "Width",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateArea,
              child: const Text("Calculate Area"),
            ),
            const SizedBox(height: 16),
            Text(
              "Area of Triangle: ${area.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "History:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final triangle = history[index];
                  return ListTile(
                    title: Text(
                      "Height: ${triangle.height}, Width: ${triangle.width}",
                    ),
                    subtitle: Text("Area: ${triangle.area.toStringAsFixed(2)}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
