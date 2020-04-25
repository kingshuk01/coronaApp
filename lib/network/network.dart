import 'dart:convert';

import 'package:corona/model/json.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Network{
  Future<CoronaModel> getData({String countryName}) async{
    var url="https://coronavirus-tracker-api.herokuapp.com/v2/locations?country="+countryName;

    final response =await get(Uri.encodeFull(url));
    if(response.statusCode==200){
      print(response.body);
      return CoronaModel.fromJson(json.decode(response.body));
    }
    else{
      print(response.statusCode);
    }
  }
}