import 'package:api_future_builder/screens/product_list_screen.dart';
import 'package:api_future_builder/services/api_service.dart';
import 'package:flutter/material.dart';

import '../model/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = ApiService.instance.fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Future Builder Example')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: futureCategories,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final categories = snapshot.data ?? [];

            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductListScreen(category: category,),
                      ),
                    );
                  },
                  title: Text(category.name),
                  subtitle: Text(category.slug),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
