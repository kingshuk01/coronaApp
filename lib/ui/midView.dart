import 'package:corona/model/json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget midView(AsyncSnapshot<CoronaModel> snapshot){
  Container midView=Container(
    
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12)
              
            ),
            child:Center(child: Text("Confirmed="+snapshot.data.latest.confirmed.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),)),    
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:30),
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12)
            ),
            child:Center(child: Text("Deaths="+snapshot.data.latest.deaths.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold)
            )),    
          ),
        ),
        
            ],),
    )
  );
  return midView;
}