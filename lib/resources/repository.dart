import 'dart:async';
import 'package:phils_movie_reviews/models/TrailerModel.dart';

import 'MovieApiProvider.dart';
import '../models/ItemModel.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() async => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) async => moviesApiProvider.fetchTrailer(movieId);

  void dispose( ) => moviesApiProvider.dispose() ;
}