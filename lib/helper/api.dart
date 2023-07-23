import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Api {
  ///// get method
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with statusCode ${response.statusCode}');
    }
  }

  ///// post method  required = is must // @required = optional
  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body
      //  {
      // 'title':'test',
      //  'price':'13.5',
      //   'description':' lorem ipsum set',
      //  'image': ' https://i.pravatar.cc',
      //  'category':' electronic' }
      ,
      headers: headers,
      //   {'Accept':'application/json',
      //  'Content-Type':'application/x-www-form-urlencoded',
      //  'Authorization':'Bearer'}
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is a problem in statusCode ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  ///// put method
  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    print('url = $url body= $body token= $token ');

    http.Response response = await http.post(
      Uri.parse(url),
      body: body
      //  {
      // 'title':'test',
      //  'price':'13.5',
      //   'description':' lorem ipsum set',
      //  'image': ' https://i.pravatar.cc',
      //  'category':' electronic' }
      ,
      headers: headers,
      //   {'Accept':'application/json',
      //  'Content-Type':'application/x-www-form-urlencoded',
      //  'Authorization':'Bearer'}
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem in statusCode ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
