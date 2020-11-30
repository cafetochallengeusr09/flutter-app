import 'package:flutter/cupertino.dart';

class Helper {
  BuildContext context;
  DateTime currentBackPressTime;

  Helper.of(BuildContext _context) {
    this.context = _context;
  }

  static getData(Map<String, dynamic> data) {
    return data['body'] ?? [];
  }

  static Uri getUri(String path) {
    //String _path = Uri.parse(GlobalConfiguration().getString('base_url')).path;
    String urlBase = "http://192.168.0.16:9898";
    String apiVersion = "/api/v1/s1";
    Uri uri = Uri(
        scheme: Uri.parse(urlBase).scheme,
        host: Uri.parse(urlBase).host,
        port: Uri.parse(urlBase).port,
        path: apiVersion + path);
    return uri;
  }
}
