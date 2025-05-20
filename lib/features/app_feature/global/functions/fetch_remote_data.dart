import 'dart:convert';

import 'package:http/http.dart' as http;

enum RequestResult { success, failure, exception }

Future<RequestResult> checkSuccess(
    {required String link, required Map body}) async {
  final response = await http.post(Uri.parse(link), body: body);

  try {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["status"] == "success") {
        return RequestResult.success;
      } else if (data["status"] == "failure") {
        return RequestResult.failure;
      }
      return RequestResult.failure;
    } else {
      throw Exception(
          'API request failed with status code ${response.statusCode}');
    }
  } catch (e) {
    return RequestResult.exception;
  }
}

Future<Map<String, dynamic>> fetchData(
    {required String link, required Map body}) async {
  final response = await http.post(Uri.parse(link), body: body);
  print(response.body);
  if (response.statusCode == 200) {
    Map responsebody = jsonDecode(response.body);
    print("-------------------------------------");
    print("data : $responsebody");
    if (responsebody['status'] == "success") {
      return responsebody['data'];
    } else {
      return {};
      // throw Exception('API request failed: {data[message]}');
    }
  } else {
    throw Exception(
        'API request failed with status code ${response.statusCode}');
  }
}
