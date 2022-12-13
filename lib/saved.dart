import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedNameWidget extends StatelessWidget {
  const SavedNameWidget({
    Key? key,
    required TextStyle biggerFont, required this.pair,
  })  : _biggerFont = biggerFont,
        super(key: key);

  final TextStyle _biggerFont;
  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        pair.asSnakeCase,
        style: _biggerFont,
      ),
    );
  }
}
