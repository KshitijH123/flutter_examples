import 'package:flutter/material.dart';
import 'package:user_app/screens/home_page.dart';
import 'package:user_app/service/api_sevice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  void login({required String username, required String password}) async {
    final logedInUser = await ApiSevice.instance.loginUser(
      username: username,
      password: password,
    );

    if (logedInUser != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HomePage(user: logedInUser,)));
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Login Failed'),
              content: Text('Please try again'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    login(
                      username: usernameController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
