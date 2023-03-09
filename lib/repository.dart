import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_api/photo_model.dart';

class Repository{
  
  static Future<List<PhotoModel>>? fetchData() async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body) as List;
    List<PhotoModel> apiData = data.map((e) {
      return PhotoModel.fromJson(e);
    }).toList();
    return apiData;
  }
}