import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/ItemModel.dart';
import '../blocs/MoviesCubit.dart';
import '../blocs/MovieDetailCubit.dart' ;
import 'MovieDetail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MoviesCubit _cubit = new MoviesCubit( ) ;
  MovieDetailCubit _movieDetailCubit = new MovieDetailCubit( ) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Phil\'s Reviews: Popular Movies'),
        ),
        body: BlocProvider<MoviesCubit>(create: (_) => _cubit, child: buildBody()));
  }

  Widget buildBody() {
    return BlocBuilder<MoviesCubit, ItemModel>(builder: (context, state ) {
      if( state == null )
        return Center(child: CircularProgressIndicator());
      else
        return buildList(state);
      // TODO handle errors from the Cubit
    }) ;
  }

  Widget buildList(ItemModel data) {
    return GridView.builder(
        itemCount: data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${data.results[index].posterPath}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(data, index),
            ),
          );
        });
  }

  openDetailPage(ItemModel data, int index) {
    _movieDetailCubit.fetchTrailersById(data.results[index].id ) ;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (_) => _movieDetailCubit,
            child: MovieDetail(
          title: data.results[index].title,
          posterUrl: data.results[index].backdropPath,
          description: data.results[index].overview,
          releaseDate: data.results[index].releaseDate,
          voteAverage: data.results[index].voteAverage.toString(),
          movieId: data.results[index].id,
        ));
      }),
    );
  }

  @override
  void initState() {
    super.initState( ) ;
    _cubit.fetchAllMovies( ) ;
  }

  @override
  void dispose() {
    _cubit.dispose();
    super.dispose();
  }
}
