import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataFetching {
  List<dynamic> apiResults = [];
  String url = 'https://randomuser.me/api/?results=10';

  Future<List<dynamic>> dataFetching() async {
    debugPrint('Fetching Result ----------------------->');
    try {
      apiResults.clear();
      final response = await http.get(Uri.parse(url));
      final results = response.body;
      final resultJson = json.decode(results);
      apiResults.add(resultJson['results']);
      print(apiResults);
    } catch (e) {
      debugPrint('Error ------------------------->\n${e.toString()}');
    }

    return apiResults;
  }
}
