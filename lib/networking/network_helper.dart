import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String baseUrl = 'catfact.ninja';

class NetworkHelper {
  static NetworkHelper shared = NetworkHelper();

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final uri = Uri.https(baseUrl, path, queryParams);
      final response = await http.get(uri);
      final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } catch (e) {
      rethrow;
    }
  }
}
