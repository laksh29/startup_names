import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_names/RandomWords.dart';
import 'package:startup_names/saved.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      // home: RandomWords(),
      routes: {
        '/': (context) => const RandomWords(),
      },
    );
  }
}
