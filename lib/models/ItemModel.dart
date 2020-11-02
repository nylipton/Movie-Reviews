import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final int _page;
  final int _totalResults;
  final int _totalPages;
  final List<_Result> _results;

  ItemModel._internal(
      this._page, this._totalResults, this._totalPages, this._results);

  factory ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    // print(parsedJson['results'].length);
    int page = parsedJson['page'];
    int totalResults = parsedJson['total_results'];
    int totalPages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }

    ItemModel model =
        ItemModel._internal(page, totalResults, totalPages, temp);

    return model;
  }

  List<_Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;

  @override
  List<Object> get props => throw [page, _totalResults, _totalPages, results];
}

/// represents a movie
class _Result extends Equatable {
  final int _voteCount;
  final int _id;
  final bool _video;
  final double _voteAverage;
  final String _title;
  final double _popularity;
  final String _posterPath;
  final String _originalLanguage;
  final String _originalTitle;
  final List<int> _genreIDs = [];
  final String _backdropPath;
  final bool _adult;
  final String _overview;
  final String _releaseDate;

  _Result(result)
      : this._voteCount = result['vote_count'],
        this._id = result['id'],
        this._video = result['video'],
        this._voteAverage = ( result['vote_average'].runtimeType == double ) ?result['vote_average']: ( result['vote_average'] as int ).toDouble(),
        this._title = result['title'],
        this._popularity = result['popularity'],
        this._posterPath = result['poster_path'],
        this._originalLanguage = result['original_language'],
        this._originalTitle = result['original_title'],
        this._backdropPath = result['backdrop_path'],
        this._adult = result['adult'],
        this._overview = result['overview'],
        this._releaseDate = result['release_date'];

  // TODO, process this in an initializer list
  // for (int i = 0; i < result['genre_ids'].length; i++) {
  // _genre_ids.add(result['genre_ids'][i]);
  // }
  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIDs => _genreIDs;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;

  @override
  List<Object> get props => [
        _voteCount,
        _id,
        _video,
        _voteAverage,
        _title,
        _popularity,
        _posterPath,
        _originalLanguage,
        _originalTitle,
        _genreIDs,
        _backdropPath,
        _adult,
        _overview,
        _releaseDate
      ];
}
