import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:notes_app/models/TrailerModel.dart';
import 'dart:convert';
import '../models/ItemModel.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "https://api.themoviedb.org/3/movie";

  /// returns a list of the most popular movies
  Future<ItemModel> fetchMovieList() async {
    // print("entered");
    final response = await client
        .get("$_baseUrl/popular?api_key=$_apiKey");
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed http request');
    }
  }

  /// returns a trailer for the indicated movie
  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
    await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}