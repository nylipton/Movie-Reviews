import 'package:equatable/equatable.dart';

class TrailerModel extends Equatable{
  final int _id;
  final List<_Result> _results ;

  TrailerModel._initialize( this._id, this._results ) ;

  factory TrailerModel.fromJson(Map<String, dynamic> parsedJson) {
    int id = parsedJson['id'];
    List<_Result> temp = [];
    // print( ( parsedJson['results'][0] as Map ).length ) ;
    for (int i = 0; i < parsedJson['results'].length; i++) {

      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    print( parsedJson ) ;
    return TrailerModel._initialize(id, temp) ;
  }

  List<_Result> get results => _results;

  int get id => _id;

  @override
  List<Object> get props => [id,_results];

  @override
  bool get stringify => true;
}

class _Result extends Equatable{
  final String _id;
  final String _iso_639_1;
  final String _iso_3166_1;
  final String _key;
  final String _name;
  final String _site;
  final int _size;
  final String _type;

  _Result(result):
    this._id = result['id'],
    this._iso_639_1 = result['iso_639_1'],
  this._iso_3166_1 = result['iso_3166_1'],
  this._key = result['key'],
  this._name = result['name'],
  this._site = result['site'],
  this._size = result['size'],
  this._type = result['type'];


  String get id => _id;

  String get iso_639_1 => _iso_639_1;

  String get iso_3166_1 => _iso_3166_1;

  String get key => _key;

  String get name => _name;

  String get site => _site;

  int get size => _size;

  String get type => _type;

  @override
  List<Object> get props => [_id, _iso_639_1,_iso_3166_1,_key,_name,_site,_size];

  @override
  bool get stringify => true;
}