import 'package:flutter/material.dart';
import 'package:user_app/model/loggedin_user_model.dart';
import 'package:user_app/model/user_list.dart';
import 'package:user_app/screens/user_details.dart';
import 'package:user_app/service/api_sevice.dart';

class HomePage extends StatefulWidget {
    final LogedInUser user; 
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> futureUsers;
  
 

  @override
  void initState() {
    super.initState();
    futureUsers = ApiSevice.instance.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: SizedBox(
        width: 226,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'User Info',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                   onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserDetails(user: widget.user),
                    ),
                  );
                },
              ),
              
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No User Found'));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(user.image, fit: BoxFit.cover),
                  title: Text(
                    user.firstName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender: ${user.gender}'),
                      Text('Birth Date: ${user.birthDate}'),
                    ],
                  ),
                  onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserDetails(user:widget.user)),
                  );
                },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
