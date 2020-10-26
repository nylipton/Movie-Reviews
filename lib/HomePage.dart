import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:notes_app/RemoteImageInfo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Taker'),
      ),
      body: Center(child: CounterWidget()),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.image),
        label: Text('LOAD'),
        // onPressed: () => fetchImages(),
      ),
    );
  }

}

Future<List<RemoteImageInfo>> fetchImageDataList() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/photos');
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    List<RemoteImageInfo> imgList = [];
    jsonList
        .forEach((element) => imgList.add(RemoteImageInfo.fromJson(element)));
    return imgList;
  } else
    throw new Exception('Couldn\'t load remote images: ${response.body}');
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;
  Future<List<RemoteImageInfo>> imgList ;

  @override
  void initState() {
    super.initState() ;
    imgList = fetchImageDataList() ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: GlobalKey(),
        child: Container(
            child: SizedBox.expand(
              child: Center(
                  child: FutureBuilder<List<RemoteImageInfo>>(
                      future:  imgList,
                      builder: (context, snapshot) {
                        if( snapshot.hasData ) {
                          return Text(snapshot.data.length.toString());
                        } else if( snapshot.hasError )
                          return Text( 'error', style: TextStyle(color: Colors.red), ) ;
                        return CircularProgressIndicator( ) ;
                      })
              ),
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            )));
  }
}
