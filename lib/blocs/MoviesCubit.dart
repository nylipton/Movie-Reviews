import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/repository.dart';
// import 'package:rxdart/rxdart.dart';
import '../models/ItemModel.dart';

class MoviesCubit extends Cubit<ItemModel>{
  final _repository = Repository();

  MoviesCubit( ) : super(null);
  // final _moviesFetcher = PublishSubject<ItemModel>();

  // Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  /// asynchronously requests the list of popular movie reviews which can be found in this class's [allMovies] field
  void fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    emit( itemModel ) ;
    // _moviesFetcher.sink.add(itemModel);
  }

  /// another name for [close]
  dispose() {
    close();
  }
}

// final MoviesBloc bloc = new MoviesBloc() ;