import 'dart:convert';
import 'dart:io';
import 'package:codehub/constant/api_path/api_path.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  static Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> post(String url, {Map? body}) async {
    var responseJson;
    try {
      final response =
          await http.post(Uri.parse(baseUrl + url), body: body ?? {});
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw Exception(response.body.toString());
      case 401:
      case 403:
        throw Exception(response.body.toString());
      case 500:
      default:
        throw Exception(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
