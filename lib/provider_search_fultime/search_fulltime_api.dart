import 'dart:convert';

import 'package:haveloc/models/fulltime_model.dart';
import 'package:http/http.dart' as http;

class FulltimeList {
  var data = [];
  List<FullTimee> results = [];
  String urlList = 'https://my-json-server.typicode.com/vamsikrishnacse/fulltime/db';

  Future<List<FullTimee>> getList({required String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body)["_embedded"]["entityModels"] as List;
        results = data.map<FullTimee>((json) => FullTimee.fromJson(json)).toList();
        print("search");
        if (query!= null){
          results = results.where((element) => element.companyname.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
