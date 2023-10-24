import 'package:http/http.dart' as http;
import 'package:whatspoppin/src/pops_feature/model/pops_item.dart';

class RemoteService{
  static var client = http.Client();

  static Future<List<PopItem>> fetchPops() async {
    var response = await client.get(Uri.parse('http://localhost:8000/pops/'));

    if(response.statusCode == 200) {
      var jsonString = response.body;
      return popItemFromJson(jsonString);
    } else {
      // show erro message
      return Future.value(null);
    }
  }
}