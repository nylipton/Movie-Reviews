import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/MovieDetailBlocProvider.dart';
import '../models/ItemModel.dart';
import '../blocs/MoviesCubit.dart';
import 'MovieDetail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MoviesCubit _cubit = new MoviesCubit( ) ;

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

        // if (snapshot.hasData) {
        //   return buildList(snapshot);
        // } else if (snapshot.hasError) {
        //   return Text(snapshot.error.toString());
        // }
        // return Center(child: CircularProgressIndicator());
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
                'https://image.tmdb.org/t/p/w185${data.results[index].poster_path}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(data, index),
            ),
          );
        });
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetailBlocProvider(
            child: MovieDetail(
          title: data.results[index].title,
          posterUrl: data.results[index].backdrop_path,
          description: data.results[index].overview,
          releaseDate: data.results[index].release_date,
          voteAverage: data.results[index].vote_average.toString(),
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
