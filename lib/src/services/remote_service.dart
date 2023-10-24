import 'dart:convert';

import 'package:whatspoppin/src/pops_feature/model/pops_item.dart';
import 'package:http/http.dart' as http;

class RemoteServer {
  static var client = http.Client();
  static String baseUrl = "http://127.0.0.1:8000/pops";
  static Map<String, String> headers = {"origin": "http://localhost:8401/"};
  static Future<List<PopItem>> fetchData() async {
    var response = await client.get(Uri.parse(baseUrl));
    // var product = [];

    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      print(response.body);
      final items = jsonDecode(response.body);
      List<PopItem> product = items.map<PopItem>((json) {
        return PopItem.fromJson(json);
      }).toList();
      // List<Product> product = items.forEach((item) {
      //   return Product.fromJson(item);
      // });
      return product;
    } else {
      print("Failed to load data");
      return [];
    }
  }
}