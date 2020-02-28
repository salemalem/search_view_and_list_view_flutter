import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

List songArtists = [];
List songNames = [];
List songLinks = [];

Future<List<String>> getSongs(url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    dom.Document document = parser.parse(response.body);
    var namesAndArtists = document.querySelectorAll("div.track-name-container > .track > .title");
    var links = document.querySelectorAll("div.download-container > a");
    final int songCountsLinks = (namesAndArtists.length / 2).round() - 2;
    final int songCountsNamesAndArtists = namesAndArtists.length - 2;
    for (var i = 0; i <= songCountsNamesAndArtists; i++) {
      if(i.isEven) {
        songArtists.add(namesAndArtists[i].text);
      } else {
        songNames.add(namesAndArtists[i].text);
      }
    }
    for (var i = 0; i <= songCountsLinks; i++) {
      songLinks.add(links[i].attributes["href"]);
    }
    debugPrint(songNames.length.toString());
    debugPrint(songArtists.length.toString());
    debugPrint(songLinks.length.toString());
    // here
  } else {
    throw Exception('Failed to load');
  }
}