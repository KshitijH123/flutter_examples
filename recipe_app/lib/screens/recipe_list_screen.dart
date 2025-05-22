import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/screens/recipe_detail.dart';
import 'package:recipe_app/services/api_services.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  late Future<List<RecipeModel>> recipeFuture;

  @override
  void initState() {
    super.initState();
    recipeFuture = ApiServices.instance.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: FutureBuilder(
        future: recipeFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return const Center(child: Text('No recipes available.'));
          } else {
            final recipes = snapshot.data!;

            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];            
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      recipe.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(recipe.name),
                    subtitle: Text(' ${recipe.cuisine} -${recipe.difficulty}'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecipeDetail(recipe: recipe),
                        ),
                      );
                    },
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
