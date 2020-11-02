
class RemoteImageInfo {
  final int albumId ;
  final int id ;
  final String title ;
  final String url ;
  final String thumbnailUrl ;

  RemoteImageInfo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory RemoteImageInfo.fromJson( Map<String, dynamic> json ) {
    return RemoteImageInfo(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'] ) ;
  }

}