import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cookingrecipe/services/recipe_service.dart';

class HomeScreen extends StatefulWidget {
  @override _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecipeService _recipeService = RecipeService();
  List<dynamic> _recipes = [];
  TextEditingController _controller = TextEditingController();

  void _searchRecipes() async {
    String query = _controller.text;
    try {
      var results = await _recipeService.fetchRecipes(query);
      setState(() {
        _recipes = results;
      });
    } catch (e) {
      log("Error fetching recipe : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Finder"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: "Entrere unn mot cle de recette"),
            )
          ],
        ),
      ),
    )
  }
}