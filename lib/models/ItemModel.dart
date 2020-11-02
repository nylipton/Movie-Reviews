import 'package:equatable/equatable.dart';

class ItemModel extends Equatable {
  final int _page;
  final int _total_results;
  final int _total_pages;
  final List<_Result> _results;

  ItemModel._internal(
      this._page, this._total_results, this._total_pages, this._results);

  factory ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    // print(parsedJson['results'].length);
    int page = parsedJson['page'];
    int total_results = parsedJson['total_results'];
    int total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }

    ItemModel model =
        ItemModel._internal(page, total_results, total_pages, temp);

    return model;
  }

  List<_Result> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;

  @override
  List<Object> get props => throw [page, _total_results, _total_pages, results];
}

/// represents a movie
class _Result extends Equatable {
  final int _vote_count;
  final int _id;
  final bool _video;
  final double _vote_average;
  final String _title;
  final double _popularity;
  final String _poster_path;
  final String _original_language;
  final String _original_title;
  final List<int> _genre_ids = [];
  final String _backdrop_path;
  final bool _adult;
  final String _overview;
  final String _release_date;

  _Result(result)
      : this._vote_count = result['vote_count'],
        this._id = result['id'],
        this._video = result['video'],
        this._vote_average = ( result['vote_average'].runtimeType == double ) ?result['vote_average']: ( result['vote_average'] as int ).toDouble(),
        this._title = result['title'],
        this._popularity = result['popularity'],
        this._poster_path = result['poster_path'],
        this._original_language = result['original_language'],
        this._original_title = result['original_title'],
        this._backdrop_path = result['backdrop_path'],
        this._adult = result['adult'],
        this._overview = result['overview'],
        this._release_date = result['release_date'];

  // TODO, process this in an initializer list
  // for (int i = 0; i < result['genre_ids'].length; i++) {
  // _genre_ids.add(result['genre_ids'][i]);
  // }
  String get release_date => _release_date;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title;

  String get original_language => _original_language;

  String get poster_path => _poster_path;

  double get popularity => _popularity;

  String get title => _title;

  double get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _vote_count;

  @override
  List<Object> get props => [
        _vote_count,
        _id,
        _video,
        _vote_average,
        _title,
        _popularity,
        _poster_path,
        _original_language,
        _original_title,
        _genre_ids,
        _backdrop_path,
        _adult,
        _overview,
        _release_date
      ];
}
