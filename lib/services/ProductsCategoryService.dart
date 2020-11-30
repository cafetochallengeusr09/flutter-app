import 'dart:convert';

import 'package:emida/helpers/helper.dart';
import 'package:emida/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductsCategoryService {
  static Future<Stream<Product>> findAll() async {
    try {
      Uri uri = Helper.getUri('/products/listAll');
      final client = new http.Client();
      final streamedRest = await client.send(http.Request('GET', uri));

      return streamedRest.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((data) => Helper.getData(data))
          .expand((data) => (data as List))
          .map((data) => Product.fromJson(data));
    } catch (e) {
      return new Stream.value(new Product.fromJson({}));
    }
  }
}
