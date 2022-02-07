import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'package:dio/dio.dart';
import 'package:exam_3/model/namoz_model.dart';
import 'package:exam_3/screens/namoz_vaqti.dart';
import 'package:path_provider/path_provider.dart';

class SeriveNamozVaqti {
  static List datas = [];
  static int day = DateTime.now().day;
  static int month = DateTime.now().month;
  static Future<List<NamozVaqtiApi>> getDataNamozVaqti() async {
    await openPath();
    Response? response;
    String region = popupMenuValue;
    try {
      response = await Dio().get(
          "https://namozvaqti.herokuapp.com/api/monthly?region=$region&month=$month");

      await putdata(response.data);
      List myData = box!.values.toList();
      if (myData.isEmpty) {
        datas.add('nodata');
      } else {
        datas = myData;
      }
    } catch (e) {
      // debugPrint("$e");
    }

    return (response!.data as List)
        .map((e) => NamozVaqtiApi.fromJson(e))
        .toList();
  }

  static Box? box;
  static Future openPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox("namozvaqti");
    return;
  }

  static putdata(var data) async {
    await box!.clear();
    for (var malumot in data) {
      if (malumot["day"] == day) {
        await box!.add(malumot);
      }
    }
  }
}
