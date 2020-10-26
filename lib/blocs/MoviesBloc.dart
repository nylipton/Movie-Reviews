import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/ItemModel.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  /// asynchronously requests the list of popular movie reviews which can be found in this class's [allMovies] field
  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final MoviesBloc bloc = new MoviesBloc() ;