import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList>{
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      home : Scaffold(
        appBar : AppBar(
          centerTitle: true,
          title : Text("Sibal WelCae neulyeo"),
        ),
        body : _buildList(),
      ),
    );
  }
  Widget _buildList(){
    return ListView.builder(itemBuilder: (context, index){
      if(index.isOdd){
        return Divider();
      }
      var realIndex = index ~/ 2;
      if(realIndex >= _suggestions.length){
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[realIndex]);
    });
  }

  Widget _buildRow(WordPair pair){
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title :Text(
        pair.asPascalCase,
        textScaleFactor: 2,
      ),
      trailing : Icon(
        alreadySaved ? Icons.star : Icons.star_border,
        color : Colors.yellow,
      ),
      onTap : (){
        setState(() {
            if (alreadySaved) {
              _saved.remove(pair); // true
            } else {
              _saved.add(pair); // false
            }
            print(_saved.toString());
          });
        }
      );

  }
}