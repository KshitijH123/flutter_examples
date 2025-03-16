import 'package:flutter/material.dart';
import 'package:user_app/model/user_list.dart';
import 'package:user_app/screens/user_details.dart';
import 'package:user_app/service/api_sevice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                    MaterialPageRoute(builder: (context) => UserDetails()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
  body: FutureBuilder<List<User>>(
    future: futureUsers,
    builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        
      }
    }
    )
    );
  }
}
