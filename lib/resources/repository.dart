import 'dart:async';
import 'package:notes_app/models/TrailerModel.dart';

import 'MovieApiProviderDart.dart';
import '../models/ItemModel.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}