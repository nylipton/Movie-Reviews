import 'dart:async';
import 'package:notes_app/models/TrailerModel.dart';

import 'MovieApiProviderDart.dart';
import '../models/ItemModel.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() async => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) async => moviesApiProvider.fetchTrailer(movieId);
}