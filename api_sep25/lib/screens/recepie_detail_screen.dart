import 'package:api_sep25/model/recepie_model.dart';
import 'package:flutter/material.dart';

class RecepieDetailScreen extends StatelessWidget {
  final RecepieModel recipe;

  const RecepieDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Column(
        children: [
          Image.network(recipe.image),
          Text(recipe.cuisine),
          Text("Rating: ${recipe.rating}"),
          Text("Difficulty: ${recipe.difficulty}"),
        ],
      ),
    );
  }
}
