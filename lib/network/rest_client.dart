import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app_flutter/models/post_response_two.dart';

class RestClient {
  static const baseURL = 'https://jsonplaceholder.typicode.com/';

  //chiamata asincrona che restituirà un oggetto di callback
  Future<PostResponseTwo> posts() async {
    final response = await http.get(Uri.parse(('${baseURL}posts')),
        /*headers: {HttpHeaders.authorizationHeader: 'Bearer token'}*/);

    if (response.statusCode == 200) {
      return PostResponseTwo.fromJson(jsonDecode(response.body)[0]);
    } else {
      throw Exception('Error response !');
    }
  }
}
