import 'dart:convert';

import 'package:adventure_travel_app/models/data_model.dart';
import 'package:http/http.dart' as http;

// http://mark.bslmeiyu.com/api
class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getinfo() async {
    var apiUrl = "/getplaces";
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        // print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
    return <DataModel>[];
    ;
  }
}
