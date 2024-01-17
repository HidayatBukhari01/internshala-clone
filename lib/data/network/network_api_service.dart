import 'dart:convert';

import 'package:internshala_clone/data/app_exceptions.dart';

import 'base_api_services.dart';
import "package:http/http.dart" as http;

class NetworkApiService extends BaseApiServices {
  dynamic _jsonResponse;
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 4));
    _jsonResponse = returnResponse(response);
    return _jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    final body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return body;
      case 404:
        throw UnAuthorisedException(body.toString());
      default:
        throw FetchDataException(body.toString());
    }
  }
}
