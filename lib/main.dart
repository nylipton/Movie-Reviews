import 'package:flutter/material.dart';
import 'package:notes_app/ui/MovieList.dart';

void main() {
  runApp(SplashApp(
      key: UniqueKey(), onInitializationComplete: () => runApp(MainApp())));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cranky Reviews',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MovieList(),);
  }
}

class SplashApp extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashApp({
    Key key,
    @required this.onInitializationComplete,
  }) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<void> _initializeAsyncDependencies() async {
    // >>> initialize async dependencies <<<
    // >>> register favorite dependency manager <<<
    // >>> reap benefits <<<
    Future.delayed(
      Duration(seconds: 5),
      () => widget.onInitializationComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_hasError) {
      return Center(
        child: RaisedButton(
          child: Text('retry'),
          onPressed: () => main(),
        ),
      );
    }
    return
        Center(
          child: Column(
              children: [
                Text('Loading...'),
          CircularProgressIndicator()]
      ) ) ;
  }
}
