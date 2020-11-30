import 'dart:convert';

import 'package:emida/helpers/helper.dart';
import 'package:emida/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<Stream<Category>> findAll() async {
    try {
      Uri uri = Helper.getUri('/category/listAll');
      final client = new http.Client();
      final streamedRest = await client.send(http.Request('GET', uri));

      return streamedRest.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((data) => Helper.getData(data))
          .expand((data) => (data as List))
          .map((data) => Category.fromJson(data));
    } catch (e) {
      return new Stream.value(new Category.fromJson({}));
    }
  }
}
