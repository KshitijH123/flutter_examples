import 'package:comment_api_demo/model/comment_list.dart';
import 'package:comment_api_demo/service/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Comment>> commentsFuture;

  @override
  void initState() {
    super.initState();
    commentsFuture = ApiService.instance.fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: FutureBuilder<List<Comment>>(
        future: commentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No comments found.'));
          } else {
            final comments = snapshot.data!;

            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        comment.body,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('by ${comment.user.username}'),
                      leading: const Icon(Icons.comment),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
