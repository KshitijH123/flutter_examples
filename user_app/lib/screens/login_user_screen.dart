import 'package:flutter/material.dart';
import 'package:user_app/model/loggedin_user_model.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({super.key,required this.logedInUser});

   final LogedInUser logedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(logedInUser.image),
              ),
            ),
           const SizedBox(height: 16),
           Text('User Name : ${logedInUser.username}',style: TextStyle(fontSize: 18),),
           const SizedBox(height: 18),
           Text('Email : ${logedInUser.email}',style: TextStyle(fontSize: 18),),
           const SizedBox(height: 16),
           Text('Name :${logedInUser.firstName},${logedInUser.lastName}'),
           const SizedBox(height: 18),
           Text('Gender : ${logedInUser.gender}',style: TextStyle(fontSize: 18),)
           ],
        ),
      ),
    );
  }
}
