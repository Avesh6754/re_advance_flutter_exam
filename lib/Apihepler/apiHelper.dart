

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper{

  ApiHelper._();
  static ApiHelper apiHelper=ApiHelper._();
  Future<List>fetchData()
  async {
    final api='https://fakestoreapi.com/products';
    Uri uri=Uri.parse(api);
     Response  response =await http.get(uri);
     if(response.statusCode==200)
       {
         print('============');
         final data=response.body;
         List json=jsonDecode(data);
         return json;
       }
     return [];
  }
}