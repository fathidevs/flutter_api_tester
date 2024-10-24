import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      });

      return jsonDecode(response.body) as dynamic;
    } catch (e) {
      print('errr: $e');
      return 'Error message!: $e';
    }
  }
}
