import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_names/saved.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = <WordPair>{};
  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return SavedNameWidget(
            biggerFont: _biggerFont,
            pair: pair,
          );
        },
      );
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];
      return Scaffold(
        appBar: AppBar(
          title: const Text("Saved Suggestions"),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Name Generator"),
        actions: [
          IconButton(
              onPressed: _pushSaved,
              tooltip: "Saved Suggestions",
              icon: const Icon(Icons.list))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const /*2*/ Divider();
          final /*3*/ index = i ~/ 2;
          if (index >= _suggestions.length) {
            /*4*/ _suggestions.addAll(generateWordPairs().take(10));
          }
          final alreadySaved = _saved.contains(_suggestions[index]);
          // return Text(_suggestions[index].asSnakeCase);
          return ListTile(
            title: Text(
              _suggestions[index].asSnakeCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? "Remove from saved" : "Save",
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
}
