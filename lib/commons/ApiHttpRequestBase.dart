import 'dart:async';
import 'dart:convert';

import 'package:emida/models/album.dart';
import 'package:http/http.dart' as http;

class ApiHttpRequestBase {
  static const String BaseUrl = 'http://yourapiwebsite.com/';

  static Future<Album> fetchAlbum() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
