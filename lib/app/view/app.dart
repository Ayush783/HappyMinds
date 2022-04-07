import 'package:flutter/material.dart';
import 'package:happyminds/home/view/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      home: const HomeViewBuilder(),
    );
  }
}
