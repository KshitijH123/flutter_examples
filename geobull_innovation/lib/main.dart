import 'package:flutter/material.dart';
import 'package:geobull_innovation/home_screen.dart';
import 'package:geobull_innovation/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final String savedName = prefs.getString('name') ?? '';
  final String savedGmail = prefs.getString('gmail') ?? '';

  runApp(MyApp(isLoggedIn: isLoggedIn, name: savedName, gmail: savedGmail));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String name;
  final String gmail;

  const MyApp({
    Key? key,
    required this.isLoggedIn,
    required this.name,
    required this.gmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geobull Innovation',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: isLoggedIn ? HomeScreen(name: name, gmail: gmail) : LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

