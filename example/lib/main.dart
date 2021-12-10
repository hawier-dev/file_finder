import 'dart:developer';

import 'package:file_finder/file_finder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List _files = [];

  @override
  void initState() {
    var fileFinder = FileFinder();
    var _files = fileFinder.findAll('mp3', sort: false);
    print(_files);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
      ),
    );
  }
}
