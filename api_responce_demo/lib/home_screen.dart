import 'package:api_responce_demo/model/posts_model.dart';
import 'package:api_responce_demo/service/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<PostModel>> postModel;
  @override
  void initState() {
    super.initState();
    postModel = ApiService.instance.fetchModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts'),
      centerTitle: true,
      elevation: 2,
      ),
    );
  }
}
