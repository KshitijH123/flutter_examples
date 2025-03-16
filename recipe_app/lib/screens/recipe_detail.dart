import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';

class RecipeDetail extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              recipe.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Cuisine: ${recipe.cuisine}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellowAccent),
                Text(
                  '${recipe.rating} (${recipe.reviewCount} reviews)',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients (${recipe.ingredients.length}):',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            ...recipe.ingredients
                .map((ingredient) => Text('- $ingredient'))
                .toList(),
            const SizedBox(height: 10),
            Text(
              'Instructions:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            ...recipe.instructions.map(
              (step) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text('• $step'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
