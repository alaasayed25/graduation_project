import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/movie.dart';


class ApiManager {
  static const String apiKey = "PUT_YOUR_API_KEY_HERE";
  static const String baseUrl = "https://api.themoviedb.org/3";

  static Future<List<Movie>> getPopularMovies() async {
    final url =
    Uri.parse("$baseUrl/movie/popular?api_key=$apiKey");

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List results = data['results'];

    return results.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.parse(
        "$baseUrl/search/movie?api_key=$apiKey&query=$query");

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List results = data['results'];

    return results.map((e) => Movie.fromJson(e)).toList();
  }
}