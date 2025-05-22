import 'package:api_demo/model/category_model.dart';
import 'package:api_demo/services/category_services.dart';
import 'package:flutter/material.dart';


class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  late Future<List<CategoryModel>> categoryFuture;

  @override
  void initState() {
    super.initState();
    categoryFuture = CategoryService.instance.fetchCategories();
  }

  String formatName(String slug) {
    return slug
        .split('-')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: FutureBuilder<List<CategoryModel>>(
        future: categoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final categories = snapshot.data;

          if (categories == null || categories.isEmpty) {
            return const Center(child: Text('No categories available.'));
          }

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Card(
                child: ListTile(
                  title: Text(formatName(category.slug)),
                  subtitle: Text(category.slug),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
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
