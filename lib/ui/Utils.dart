import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{
  static void showSnackBar(BuildContext context, String text)=>
      Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));

  static dynamic fromDateTimeToJson(DateTime createdTime) {
    if (createdTime==null) return null;
    return createdTime.toUtc();
  }
  static DateTime? toDateTime(Timestamp v){
    if(v==null) return null;
    return v.toDate();
  }
}