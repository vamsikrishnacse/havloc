import 'package:flutter/material.dart';

import '../models/fulltime_model.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class InternProvider with ChangeNotifier {
  // List<FullTimee> _full = [] ;
  // static const fulltime = 'https://441db945-9b6f-4793-a030-50c480d10dff.mock.pstmn.io/users';
  //
  // Future<void> getData() async {
  //   final url = Uri.parse(fulltime);
  //   final headers = {"Content-type": "application/json",
  //     "content-type": "application/json"  ,
  //     "API-KEY": "ontrarytopopularbeliefLoremIp" };
  //   const body = '{ "key": "jobType","operation": "EQUAL","value": "FULL_TIME"}';
  //   final response = await post(url, headers: headers, body: body);
  //     final jsondata1 = jsonDecode(response.body)["_embedded"]["entityModels"] as List ;
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  //   print('Body: $jsondata1');
  //   _full = jsondata1.map<FullTimee>(FullTimee.fromJson).toList();
  //   notifyListeners();
  // }

  var data = [];
  // var data2 = [];
  // var data3 = [];
  List<FullTimee> _full = [] ;
  late FullTimeel _linkes ;
  late FullTimeep _pages ;
  static const fulltime = 'https://my-json-server.typicode.com/vamsikrishnacse/fulltime/db';

  Future<void> getData() async {
    final url = Uri.parse(fulltime);
    try {
      // final headers = {"Content-type": "application/json",
      //   "content-type": "application/json"  ,
      //   "API-KEY": "ontrarytopopularbeliefLoremIp" };
      // const body = '[{ "key": "jobType","operation": "EQUAL","value": "FULL_TIME"}]';
      final response = await http.get(url);
      if (response.statusCode == 200) {

        data = jsonDecode(response.body)["_embedded"]["entityModels"] as List ;
        _full =data.map<FullTimee>(FullTimee.fromJson).toList();

        final data2=
        json.decode(response.body)['_links']["next"] ;
        // final jsonValue = json.decode(data2);
        // final jsonValue2 = json.decode(jsonValue);
        _linkes = new FullTimeel.fromJson(data2);
        print('links');
        print('Body: ${_linkes.next}');
        final data3=
        json.decode(response.body)['page'] ;
        // final jsonValuep = json.decode(data2);
        _pages = new FullTimeep.fromJson(data3);
        print('Body: ${_pages.size}');

        print('Status code: ${response.statusCode}');
        print('Body: ${response.body}');
        print('Body: $data');
        print('Body: $data2');
        print('Body: $data3');
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    notifyListeners();
    // return _full;
  }

  Future<void> getlist(String link) async {
    print(link);
    var url = Uri.parse(link);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = jsonDecode(response.body)["_embedded"]["entityModels"] as List ;
        _full =data.map<FullTimee>(FullTimee.fromJson).toList();
        print('Body: $data');
        final data2=
        json.decode(response.body)['_links']["next"] ;
        // final jsonValue = json.decode(data2);
        // final jsonValue2 = json.decode(jsonValue);
        _linkes = new FullTimeel.fromJson(data2);
        print('Body: $_linkes');
        final data3=
        json.decode(response.body)['page'] ;
        // final jsonValuep = json.decode(data2);
        _pages = new FullTimeep.fromJson(data3);
        // if (query!= null){
        //   results = results.where((element) => element.companyname.toLowerCase().contains((query.toLowerCase()))).toList();
        // }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    notifyListeners();
  }
  // Future<void> readJson() async {
  //     final url = Uri.parse(urlPrefix);
  //     final headers = {"Content-type": "application/json",
  //       "content-type": "application/json"  ,
  //       "API-KEY": "ontrarytopopularbeliefLoremIp" };
  //     const body = '{ "key": "jobType","operation": "EQUAL","value": "FULL_TIME"}';
  //   final String response = await post(url, headers: headers, body: body);
  //     final jsondata1 = jsonDecode(response.body) ;
  //   setState(() {
  //     _items = data["items"];
  //   });
  // }

  List<FullTimee> get full {
    return [..._full];
  }

  FullTimeel get linkes {
    return _linkes;
  }FullTimeep get pages {
    return _pages;
  }


  // Product findById(String id) {
  //   return _full.firstWhere((prod) => prod.id == id);
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
