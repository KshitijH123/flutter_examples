import 'package:flutter/material.dart';
import 'package:todo_api/model/post.dart';
import 'package:todo_api/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();

    futurePost = ApiService.instance.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Api')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: futurePost,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final posts = snapshot.data ?? [];

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
