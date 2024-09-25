import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeService {
  final String apiUrl = "https://api.spoonacular.com/recipes/complexSearch";
  final String apiKey = "YOUR_API_KEY"; //todo get api key from spoonacular

  Future<List<dynamic>> fetchRecipes(String query) async {
    final response = await http.get(Uri.parse('$apiUrl?query=$query&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}