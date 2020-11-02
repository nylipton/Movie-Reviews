import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/TrailerModel.dart';
import '../resources/repository.dart';

class MovieDetailCubit extends Cubit<TrailerModel> {
  final _repository = Repository();

  MovieDetailCubit( ) : super( null ) ;

  void fetchTrailersById( int movieId ) async {
    TrailerModel model = await _repository.fetchTrailers(movieId) ;
    emit( model ) ;
  }

  /// another name for [close]
  dispose() {
    _repository.dispose() ;
    close();
  }
}