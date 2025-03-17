import 'package:flutter/material.dart';
import 'package:user_app/model/loggedin_user_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.user});

  final LogedInUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Padding(padding: EdgeInsets.all(16)),
            Image.network(
              user.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text('${user.firstName} ${user.lastName}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
             const SizedBox(height: 4),
             Text('• Birth Date: ${user.username}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
             const SizedBox(height: 4,),
             Text('• Age : ${user.email.toString()}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
             const SizedBox(height: 4),
             Text('• Genger : ${user.gender}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
             const SizedBox(height: 4),
             Text("• PassWord : ${user.gender}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
