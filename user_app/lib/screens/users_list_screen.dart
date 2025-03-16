// import 'package:flutter/material.dart';
// import 'package:user_app/service/user_list_service.dart';

// class UserListScreen extends StatefulWidget {
//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   late Future<List<User>> futureUsers;

//   @override
//   void initState() {
//     super.initState();
//     futureUsers = fetchUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User List')),
//       body: FutureBuilder<List<User>>(
//         future: futureUsers,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No users found'));
//           }
          
//           final users = snapshot.data!;
//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               final user = users[index];
//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: ListTile(
//                   title: Text(user.firstName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Gender: ${user.gender}'),
//                       Text('Birth Date: ${user.birthDate}'),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: UserListScreen(),
//   ));
// }